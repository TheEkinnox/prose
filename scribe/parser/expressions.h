#pragma once
#include "lexer/lexer.h"

#include "parser/statements.h"
#include "parser/postfix.h"
#include "parser/types.h"

#include <memory>
#include <variant>

struct Expression : Statement
{
};

struct PostfixExpression : Expression
{
    std::vector<std::unique_ptr<Postfix>> postfix;

    std::ostream& PrintPostfix(std::ostream& os, ParserDepthT depth) const;
};

struct LiteralExpression : PostfixExpression
{
    explicit LiteralExpression(Token p_token);

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

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct SizeOfExpression : Expression
{
    std::variant<Type, std::unique_ptr<Expression>> type;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

ParseResult ParseExpression(TokenStream& stream, std::unique_ptr<Expression>& out);
bool RequireExpression(TokenStream& stream, std::unique_ptr<Expression>& out, bool allowRange);
bool RequireExpression(TokenStream& stream, std::unique_ptr<Expression>& out);
