#pragma once
#include "lexer/lexer.h"

#include "parser/fwd.h"
#include "parser/token_stream.h"

#include <iosfwd>
#include <memory>
#include <optional>
#include <vector>

#define T_STATEMENT( Name ) [[nodiscard]] StatementType GetType() const override { return StatementType::Name; }

struct Statement
{
    Token start;

    Statement() = default;
    Statement(const Statement&) = default;
    Statement& operator=(const Statement&) = default;
    virtual ~Statement() = default;

    [[nodiscard]] virtual StatementType GetType() const = 0;

    virtual std::ostream& Print(std::ostream& os, ParserDepthT depth) const = 0;
    std::ostream& PrintType(std::ostream& os, ParserDepthT depth) const;
    std::ostream& PrintStart(std::ostream& os, ParserDepthT depth) const;
};

struct Block
{
    std::vector<std::unique_ptr<Statement>> statements;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const;
};

struct NamedBlock : Statement
{
    T_STATEMENT(INTERNAL)

    Block body;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct ConditionalBlock : NamedBlock
{
    std::unique_ptr<Expression> condition;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct IfStatement : Statement
{
    T_STATEMENT(IfStatement)

    ConditionalBlock mainBranch;
    std::vector<ConditionalBlock> conditionalBranches;
    std::optional<NamedBlock> defaultBranch;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct WhileStatement : ConditionalBlock
{
    T_STATEMENT(WhileStatement)

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct RepeatStatement : ConditionalBlock
{
    T_STATEMENT(RepeatStatement)

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct ForStatement : Statement
{
    T_STATEMENT(ForStatement)

    Token iterator;
    bool isRef;
    std::unique_ptr<Expression> range;
    Block body;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct SwitchCase : ConditionalBlock
{
    bool isFallthrough;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct SwitchStatement : Statement
{
    T_STATEMENT(SwitchStatement)

    std::unique_ptr<Expression> expression;
    std::vector<SwitchCase> cases;
    std::optional<NamedBlock> fallback;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct ControlStatement : Statement
{
    explicit ControlStatement(const Token& p_start);

    [[nodiscard]] StatementType GetType() const override;
    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct ReturnStatement : ControlStatement
{
    T_STATEMENT(ReturnStatement)

    std::unique_ptr<Expression> value;

    explicit ReturnStatement(const Token& p_start);

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct DeferStatement : Statement
{
    T_STATEMENT(DeferStatement)

    std::unique_ptr<PostfixExpression> call;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct ScopeStatement : NamedBlock
{
    T_STATEMENT(ScopeStatement)

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

bool ParseBlock(TokenStream& stream, Block& out, const Token& start);
bool ParseBlock(TokenStream& stream, Block& out, const Token& start, const TokenStream::ConditionFunc& exitCondition);
ParseResult ParseStatement(TokenStream& stream, std::unique_ptr<Statement>& out);
bool RequireStatement(TokenStream& stream, std::unique_ptr<Statement>& out);
