#pragma once
#include "lexer/lexer.h"

#include "parser/statements.h"
#include "parser/postfix.h"
#include "parser/types.h"

#include <memory>

struct Expression : Statement
{
};

struct PostfixExpression : Expression
{
    std::vector<std::unique_ptr<Postfix>> postfix;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct LiteralExpression : PostfixExpression
{
    Token token;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct ArrayLiteralExpression : PostfixExpression
{
    std::vector<std::unique_ptr<Expression>> elements;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct ConstructionExpression : PostfixExpression
{
    Type type;
    std::vector<std::unique_ptr<Expression>> arguments;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct UnaryExpression : PostfixExpression
{
    Token op;
    std::unique_ptr<Expression> operand;

    explicit UnaryExpression(Token p_op, std::unique_ptr<Expression>&& p_operand);

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct BinaryExpression : PostfixExpression
{
    Token op;
    std::unique_ptr<Expression> left, right;

    BinaryExpression(Token p_op, std::unique_ptr<Expression>&& p_left, std::unique_ptr<Expression>&& p_right);

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct MakeExpression : Expression
{
    ConstructionExpression construction;

    explicit MakeExpression(ConstructionExpression&& p_construction);

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct SizeOfExpression : Expression
{
    bool isBuiltInType;

    union
    {
        std::unique_ptr<Expression> value = nullptr;
        Type type;
    };

    ~SizeOfExpression() override;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

ParseResult ParseExpression(TokenStream& stream, std::unique_ptr<Expression>& out);
bool RequireExpression(TokenStream& stream, std::unique_ptr<Expression>& out, bool allowRange);
bool RequireExpression(TokenStream& stream, std::unique_ptr<Expression>& out);
