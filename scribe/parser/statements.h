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

struct ConditionalBlock
{
    std::unique_ptr<Expression> condition;
    Block body;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const;
};

struct IfStatement : Statement
{
    ConditionalBlock mainBranch;
    std::vector<ConditionalBlock> conditionalBranches;
    std::optional<Block> defaultBranch;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct WhileStatement : Statement
{
    std::unique_ptr<Expression> condition;
    Block body;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct RepeatStatement : Statement
{
    std::unique_ptr<Expression> condition;
    Block body;

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

struct ScopeStatement : Statement
{
    Block body;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

bool ParseBlock(TokenStream& stream, Block& out, const Token& start);
bool ParseBlock(TokenStream& stream, Block& out, const Token& start, const TokenStream::ConditionFunc& exitCondition);
ParseResult ParseStatement(TokenStream& stream, std::unique_ptr<Statement>& out);
bool RequireStatement(TokenStream& stream, std::unique_ptr<Statement>& out);
