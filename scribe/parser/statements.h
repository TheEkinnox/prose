#pragma once
#include "lexer/lexer.h"

#include "parser/fwd.h"
#include "parser/token_stream.h"

#include <iosfwd>
#include <memory>
#include <optional>
#include <vector>

struct Statement
{
    Statement() = default;
    Statement(const Statement&) = default;
    Statement& operator=(const Statement&) = default;
    virtual ~Statement() = default;

    virtual std::ostream& Print(std::ostream& os, ParserDepthT depth) const = 0;
};

struct Block
{
    std::vector<std::unique_ptr<Statement>> statements;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const;
};

struct ConditionalBlock : Statement
{
    std::unique_ptr<Expression> condition;
    Block body;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct IfStatement : Statement
{
    ConditionalBlock mainBranch;
    std::vector<ConditionalBlock> conditionalBranches;
    std::optional<Block> defaultBranch;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct WhileStatement : ConditionalBlock
{
    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct RepeatStatement : ConditionalBlock
{
    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct ForStatement : Statement
{
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
    std::unique_ptr<Expression> expression;
    std::vector<SwitchCase> cases;
    std::optional<Block> fallback;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

CLANG_IGNORE_WARNING_PUSH("-Wglobal-constructors")
BETTER_ENUM(ControlStatementType, uint8_t,
    Return,
    Break,
    Continue
)
CLANG_IGNORE_WARNING_POP

struct ControlStatement : Statement
{
    ControlStatementType type;

    explicit ControlStatement(const ControlStatementType p_type) : type(p_type) {}

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct ReturnStatement : ControlStatement
{
    std::unique_ptr<Expression> value;

    explicit ReturnStatement(std::unique_ptr<Expression>&& p_value);

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct ScopeStatement : Statement
{
    Block body;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

bool ParseBlock(TokenStream& stream, Block& out, const Token& start);
bool ParseBlock(TokenStream& stream, Block& out, const Token& start, const TokenStream::ConditionFunc& exitCondition);
ParseResult ParseStatement(TokenStream& stream, std::unique_ptr<Statement>& out);
bool RequireStatement(TokenStream& stream, std::unique_ptr<Statement>& out);
