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
    T_STATEMENT(LiteralExpression)

    explicit LiteralExpression(const Token& p_token);

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct ArrayLiteralExpression : PostfixExpression
{
    T_STATEMENT(ArrayLiteralExpression)

    std::vector<std::unique_ptr<Expression>> elements;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct IdentifierExpression : PostfixExpression
{
    T_STATEMENT(IdentifierExpression)

    explicit IdentifierExpression(const Token& p_token);

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct ConstructionExpression : PostfixExpression
{
    T_STATEMENT(ConstructionExpression)

    Type type;
    std::vector<std::unique_ptr<Expression>> arguments;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct UnaryExpression : PostfixExpression
{
    T_STATEMENT(UnaryExpression)

    std::unique_ptr<Expression> operand;

    explicit UnaryExpression(Token p_op, std::unique_ptr<Expression>&& p_operand);

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct BinaryExpression : PostfixExpression
{
    T_STATEMENT(BinaryExpression)

    Token op;
    std::unique_ptr<Expression> left, right;

    BinaryExpression(Token p_op, std::unique_ptr<Expression>&& p_left, std::unique_ptr<Expression>&& p_right);

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct MakeExpression : Expression
{
    T_STATEMENT(MakeExpression)

    ConstructionExpression construction;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct SizeOfExpression : Expression
{
    T_STATEMENT(SizeOfExpression)

    std::variant<Type, std::unique_ptr<Expression>> type;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

ParseResult ParseExpression(TokenStream& stream, std::unique_ptr<Expression>& out);
bool RequireExpression(TokenStream& stream, std::unique_ptr<Expression>& out, bool allowRange);
bool RequireExpression(TokenStream& stream, std::unique_ptr<Expression>& out);
