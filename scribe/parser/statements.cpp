#include "statements.h"

#include <utility>

#include "declarations.h"
#include "lexer/token_type.h"

#include "parser/expressions.h"
#include "parser/parser.h"
#include "parser/token_stream.h"
#include "utility/strings.h"

#include <cassert>

std::ostream& Block::Print(std::ostream& os, const ParserDepthT depth) const
{
    if (statements.empty())
        return PrintAtDepth(os, depth, "Empty Block");

    for (size_t i = 0; i < statements.size(); ++i)
        statements[i]->Print(os << (i == 0 ? "" : "\n"), depth);

    return os;
}

std::ostream& ConditionalBlock::Print(std::ostream& os, ParserDepthT depth) const
{
    PrintAtDepth(os, depth, "Condition:") << '\n';
    condition->Print(os, depth + 1) << '\n';
    PrintAtDepth(os, depth, "Body:") << '\n';
    return body.Print(os, depth + 1);
}

std::ostream& IfStatement::Print(std::ostream& os, ParserDepthT depth) const
{
    PrintAtDepth(os, depth++, "IfStatement") << '\n';
    PrintAtDepth(os, depth, "Main branch:") << '\n';
    mainBranch.Print(os, depth + 1) << '\n';

    PrintAtDepth(os, depth, "Conditional branches:");
    if (!conditionalBranches.empty())
    {
        for (const auto& branch : conditionalBranches)
            branch.Print(os << '\n', depth + 1);
    }
    else
    {
        os << " None";
    }

    PrintAtDepth(os << '\n', depth, "Default branch:");
    if (defaultBranch)
        return defaultBranch->Print(os << '\n', depth + 1);

    return os << " None";
}

std::ostream& WhileStatement::Print(std::ostream& os, ParserDepthT depth) const
{
    PrintAtDepth(os, depth++, "WhileStatement") << '\n';
    return ConditionalBlock::Print(os, depth);
}

std::ostream& RepeatStatement::Print(std::ostream& os, ParserDepthT depth) const
{
    PrintAtDepth(os, depth++, "RepeatStatement") << '\n';
    return ConditionalBlock::Print(os, depth);
}

std::ostream& ForStatement::Print(std::ostream& os, ParserDepthT depth) const
{
    PrintAtDepth(os, depth++, "ForStatement") << '\n';
    PrintAtDepth(os, depth, "Iterator:") << '\n';
    PrintAtDepth(os, depth + 1, "Name: ") << iterator.value << '\n';
    PrintAtDepth(os, depth + 1, "Is Ref: ") << (isRef ? "true" : "false") << '\n';
    PrintAtDepth(os, depth, "Range:") << '\n';
    range->Print(os, depth + 1) << '\n';
    PrintAtDepth(os, depth, "Body:") << '\n';
    return body.Print(os, depth + 1);
}

std::ostream& SwitchCase::Print(std::ostream& os, ParserDepthT depth) const
{
    PrintAtDepth(os, depth, "Is Fallthrough: ") << (isFallthrough ? "true" : "false") << '\n';
    return ConditionalBlock::Print(os, depth);
}

std::ostream& SwitchStatement::Print(std::ostream& os, ParserDepthT depth) const
{
    PrintAtDepth(os, depth++, "SwitchStatement") << '\n';
    PrintAtDepth(os, depth, "Expression:") << '\n';
    expression->Print(os, depth + 1) << '\n';
    if (!cases.empty())
    {
        for (size_t i = 0; i < cases.size(); ++i)
        {
            PrintAtDepth(os, depth, "Case " + std::to_string(i) + ":") << '\n';
            cases[i].Print(os, depth + 1) << '\n';
        }
    }
    else
    {
        PrintAtDepth(os, depth, "Cases: None") << '\n';
    }

    PrintAtDepth(os, depth, "Default:");
    if (fallback)
        return fallback->Print(os << '\n', depth + 1);

    return os << " None";
}

std::ostream& ScopeStatement::Print(std::ostream& os, ParserDepthT depth) const
{
    PrintAtDepth(os, depth++, "ScopeStatement") << '\n';
    return body.Print(os, depth);
}

static bool IsEnd(const TokenType t)
{
    return t == TokenType::KW_END;
}

static bool ParseConditionalBlock(TokenStream& stream, ConditionalBlock& out, const Token& startToken, const TokenStream::ConditionFunc& exitCondition)
{
    assert(startToken);
    if (!RequireExpression(stream, out.condition))
        return false;

    Token token;
    if (!stream.Expect(IsTerminator, token, "Expected terminator"))
        return false;

    if (!ParseBlock(stream, out.body, startToken, exitCondition))
        return false;

    return true;
}

static bool ParseConditionalBlock(TokenStream& stream, ConditionalBlock& out, const TokenType type, const TokenStream::ConditionFunc& exitCondition)
{
    out.condition = nullptr;
    out.body = Block{};

    Token token;
    if (!stream.Expect(type, token))
        return false;

    return ParseConditionalBlock(stream, out, token, exitCondition);
}

static bool ParseIfStatement(TokenStream& stream, std::unique_ptr<Statement>& out)
{
    out = nullptr;

    Token elseToken{};
    const auto branchExitFunc = [&elseToken, &stream](const TokenType t)
    {
        if (t == TokenType::KW_ELSE)
        {
            elseToken = stream.Peek();
            return true;
        }

        return t == TokenType::KW_END;
    };

    IfStatement statement{};
    if (!ParseConditionalBlock(stream, statement.mainBranch, TokenType::KW_IF, branchExitFunc))
        return false;

    while (elseToken)
    {
        const Token elseStartToken = elseToken;
        elseToken = {};

        if (stream.Is(TokenType::KW_IF))
        {
            if (statement.defaultBranch.has_value())
            {
                LogError(stream.Peek(), "Conditional branch after default branch");
                return false;
            }

            ConditionalBlock conditionalBranch{};
            if (!ParseConditionalBlock(stream, conditionalBranch, TokenType::KW_IF, branchExitFunc))
                return false;

            statement.conditionalBranches.emplace_back(std::move(conditionalBranch));
        }
        else
        {
            Block block{};
            if (!ParseBlock(stream, block, elseStartToken, branchExitFunc))
                return false;

            statement.defaultBranch = std::move(block);
        }
    }

    out = std::make_unique<IfStatement>(std::move(statement));
    return true;
}

static bool ParseWhileStatement(TokenStream& stream, std::unique_ptr<Statement>& out)
{
    out = nullptr;

    WhileStatement statement{};
    if (!ParseConditionalBlock(stream, statement, TokenType::KW_WHILE, IsEnd))
        return false;

    out = std::make_unique<WhileStatement>(std::move(statement));
    return true;
}

static bool ParseRepeatStatement(TokenStream& stream, std::unique_ptr<Statement>& out)
{
    out = nullptr;

    Token token;
    if (!stream.Expect(TokenType::KW_REPEAT, token))
        return false;

    RepeatStatement statement{};
    const auto isUntil = [](const TokenType t) { return t == TokenType::KW_UNTIL; };
    if (!ParseBlock(stream, statement.body, token, isUntil))
        return false;

    if (!RequireExpression(stream, statement.condition))
        return false;

    if (stream.ConsumeIf(IsTerminator, token) && token.type != TokenType::KW_END && !stream.Expect(TokenType::KW_END, token))
        return false;

    out = std::make_unique<RepeatStatement>(std::move(statement));
    return true;
}

static bool ParseForStatement(TokenStream& stream, std::unique_ptr<Statement>& out)
{
    out = nullptr;

    Token token;
    if (!stream.Expect(TokenType::KW_FOR, token))
        return false;

    const Token forToken = token;
    ForStatement statement{};
    if (!stream.Expect(TokenType::IDENTIFIER, statement.iterator))
        return false;

    if (stream.ConsumeIf(TokenType::OP_BITWISE_AND, token))
        statement.isRef = true;

    if (!stream.Expect(TokenType::KW_IN, token))
        return false;

    if (!RequireExpression(stream, statement.range, true))
        return false;

    if (!ParseBlock(stream, statement.body, forToken))
        return false;

    out = std::make_unique<ForStatement>(std::move(statement));
    return true;
}

static bool ParseSwitchStatement(TokenStream& stream, std::unique_ptr<Statement>& out)
{
    out = nullptr;

    Token token;
    if (!stream.Expect(TokenType::KW_SWITCH, token))
        return false;

    SwitchStatement statement{};
    if (!RequireExpression(stream, statement.expression) || !stream.Expect(IsTerminator, token, "Expected terminator"))
        return false;

    if (token.type == TokenType::KW_END)
    {
        LogError(token, "Expected case or default");
        return false;
    }

    const auto isCaseDefaultOrEnd = [](const TokenType t)
    {
        return t == TokenType::KW_CASE || t == TokenType::KW_DEFAULT || t == TokenType::KW_END;
    };

    const auto caseExitFunc = [&isCaseDefaultOrEnd, &token, &stream](const TokenType t)
    {
        token = stream.Peek();
        return isCaseDefaultOrEnd(t) || t == TokenType::KW_FALLTHROUGH;
    };

    const bool hasCases = stream.ConsumeIf(TokenType::KW_CASE, token);
    while (token.type == TokenType::KW_CASE)
    {
        SwitchCase switchCase{};
        if (!ParseConditionalBlock(stream, switchCase, token, caseExitFunc))
            return false;

        switchCase.isFallthrough = token.type == TokenType::KW_FALLTHROUGH;

        if (switchCase.isFallthrough)
        {
            const Token fallthroughToken = token;
            if (!stream.Expect(TokenType::TERMINATOR, token) || !stream.Expect(isCaseDefaultOrEnd, token, "Expected case, default or end"))
                return false;

            if (token.type == TokenType::KW_END)
            {
                LogError(fallthroughToken, "Invalid in last case");
                return false;
            }
        }

        statement.cases.emplace_back(std::move(switchCase));
    }

    if (!hasCases)
    {
        token = stream.Peek(); // Necessary for proper error reporting
        stream.ConsumeIf(TokenType::KW_DEFAULT, token);
    }

    if (token.type == TokenType::KW_DEFAULT)
    {
        Block block{};
        if (!ParseBlock(stream, block, token, caseExitFunc))
            return false;

        if (token.type != TokenType::KW_END)
        {
            LogError(token, "Expected default case end");
            return false;
        }

        statement.fallback = std::move(block);
    }

    out = std::make_unique<SwitchStatement>(std::move(statement));
    return true;
}

static bool ParseScopeStatement(TokenStream& stream, std::unique_ptr<Statement>& out)
{
    out = nullptr;

    Token token;
    if (!stream.Expect(TokenType::KW_SCOPE, token))
        return false;

    ScopeStatement statement{};
    if (!ParseBlock(stream, statement.body, token))
        return false;

    out = std::make_unique<ScopeStatement>(std::move(statement));
    return true;
}

bool ParseBlock(TokenStream& stream, Block& out, const Token& start)
{
    return ParseBlock(stream, out, start, IsEnd);
}

bool ParseBlock(TokenStream& stream, Block& out, const Token& start, const TokenStream::ConditionFunc& exitCondition)
{
    out.statements.clear();

    Token token;
    bool consumedExit = false;
    while (!stream.Match(exitCondition))
    {
        if (stream.ConsumeIf(IsTerminator, token))
        {
            if (exitCondition(token.type))
            {
                consumedExit = true;
                break;
            }

            if (token.type == TokenType::TOKEN_EOF)
            {
                LogError(stream.Peek(), "Unclosed '" + std::string(start.value) + "' block at " + std::to_string(start.line) + ":" + std::to_string(start.column));
                return false;
            }

            continue;
        }

        std::unique_ptr<Statement> statement;
        if (!RequireStatement(stream, statement))
            return false;

        if (!stream.Expect(IsTerminator, token, "Expected terminator"))
            return false;

        out.statements.emplace_back(std::move(statement));

        if (exitCondition(token.type))
        {
            consumedExit = true;
            break;
        }
    }

    if (!consumedExit)
        stream.Consume();

    return true;
}

ParseResult ParseStatement(TokenStream& stream, std::unique_ptr<Statement>& out)
{
    const Token& token = stream.Peek();
    switch (token.type)
    {
    case TokenType::KW_IF:
        return ParseIfStatement(stream, out) ? ParseResult::Success : ParseResult::Failure;
    case TokenType::KW_WHILE:
        return ParseWhileStatement(stream, out) ? ParseResult::Success : ParseResult::Failure;
    case TokenType::KW_REPEAT:
        return ParseRepeatStatement(stream, out) ? ParseResult::Success : ParseResult::Failure;
    case TokenType::KW_FOR:
        return ParseForStatement(stream, out) ? ParseResult::Success : ParseResult::Failure;
    case TokenType::KW_SWITCH:
        return ParseSwitchStatement(stream, out) ? ParseResult::Success : ParseResult::Failure;
    case TokenType::KW_SCOPE:
        return ParseScopeStatement(stream, out) ? ParseResult::Success : ParseResult::Failure;
    default:
    {
        std::unique_ptr<Declaration> declaration;
        ParseResult result = ParseDeclaration(stream, declaration);
        if (result == ParseResult::Success)
        {
            out = std::move(declaration);
            return ParseResult::Success;
        }

        if (result == ParseResult::Failure)
            return ParseResult::Failure;

        std::unique_ptr<Expression> expression;
        result = ParseExpression(stream, expression);
        if (result == ParseResult::Success)
        {
            out = std::move(expression);
            return ParseResult::Success;
        }

        if (result == ParseResult::Failure)
            return ParseResult::Failure;

        return ParseResult::None;
    }
    }
}

bool RequireStatement(TokenStream& stream, std::unique_ptr<Statement>& out)
{
    const ParseResult result = ParseStatement(stream, out);
    if (result == ParseResult::Success)
        return true;

    if (result == ParseResult::None)
        LogError(stream.Peek(), "Expected statement");

    return false;
}
