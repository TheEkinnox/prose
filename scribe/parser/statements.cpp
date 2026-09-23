#include "statements.h"

#include <utility>

#include "declarations.h"
#include "lexer/token_type.h"

#include "parser/expressions.h"
#include "parser/parser.h"
#include "parser/token_stream.h"
#include "utility/strings.h"

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

std::ostream& ScopeStatement::Print(std::ostream& os, ParserDepthT depth) const
{
    PrintAtDepth(os, depth++, "ScopeStatement") << '\n';
    return body.Print(os, depth);
}

static bool ParseConditionalBlock(TokenStream& stream, ConditionalBlock& out, const TokenStream::ConditionFunc& exitCondition)
{
    out.condition = nullptr;
    out.body = Block{};

    Token token;
    if (!stream.Expect(TokenType::KW_IF, token))
        return false;

    const Token ifToken = token;
    if (!RequireExpression(stream, out.condition))
        return false;

    if (!stream.Expect(IsTerminator, token, "Expected terminator"))
        return false;

    if (!ParseBlock(stream, out.body, ifToken, exitCondition))
        return false;

    return true;
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
    if (!ParseConditionalBlock(stream, statement.mainBranch, branchExitFunc))
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
            if (!ParseConditionalBlock(stream, conditionalBranch, branchExitFunc))
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
    const auto isEnd = [](const TokenType t) { return t == TokenType::KW_END; };
    return ParseBlock(stream, out, start, isEnd);
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
