#include "expressions.h"

#include "parser/parser.h"
#include "parser/postfix.h"
#include "parser/token_stream.h"

#include "utility/strings.h"

NO_WARNINGS_PUSH
#include <magic_enum/magic_enum.hpp>
NO_WARNINGS_POP

#include <optional>

std::ostream& PostfixExpression::PrintPostfix(std::ostream& os, ParserDepthT depth) const
{
    PrintAtDepth(os, depth, "Postfix:");
    if (postfix.empty())
        return os << " None";

    for (const auto& postfixOperation : postfix)
        postfixOperation->Print(os << '\n', depth + 1);

    return os;
}

LiteralExpression::LiteralExpression(Token p_token)
{
    assert(IsLiteral(p_token.type) || p_token.type == TokenType::IDENTIFIER);
    start = std::move(p_token);
}

std::ostream& LiteralExpression::Print(std::ostream& os, ParserDepthT depth) const
{
    PrintAtDepth(os, depth++, start) << '\n';
    return PrintPostfix(os, depth);
}

std::ostream& ArrayLiteralExpression::Print(std::ostream& os, ParserDepthT depth) const
{
    PrintAtDepth(os, depth++, "ArrayLiteralExpression") << '\n';
    PrintStart(os, depth) << '\n';
    PrintAtDepth(os, depth, "Elements:");

    if (elements.empty())
    {
        os << " None";
    }
    else
    {
        for (const auto& element : elements)
            element->Print(os << '\n', depth + 1);
    }

    return PrintPostfix(os << '\n', depth);
}

static std::ostream& PrintConstructionExpression_Internal(const ConstructionExpression& expression, std::ostream& os, ParserDepthT depth)
{
    PrintAtDepth(os, depth, "Type:") << '\n';
    expression.type.Print(os, depth + 1) << '\n';
    PrintAtDepth(os, depth, "Arguments:");

    if (expression.arguments.empty())
        return os << " None";

    for (const auto& argument : expression.arguments)
        argument->Print(os << '\n', depth + 1);

    return os;
}

std::ostream& ConstructionExpression::Print(std::ostream& os, ParserDepthT depth) const
{
    PrintAtDepth(os, depth++, "ConstructionExpression") << '\n';
    PrintStart(os, depth) << '\n';
    PrintConstructionExpression_Internal(*this, os, depth) << '\n';
    return PrintPostfix(os, depth);
}

UnaryExpression::UnaryExpression(Token p_op, std::unique_ptr<Expression>&& p_operand) : operand(std::move(p_operand))
{
    assert(IsUnaryOperator(p_op.type));
    start = std::move(p_op);
}

std::ostream& UnaryExpression::Print(std::ostream& os, ParserDepthT depth) const
{
    PrintAtDepth(os, depth++, "UnaryExpression") << '\n';
    PrintAtDepth(os, depth, "Operator: ") << start << '\n';
    PrintAtDepth(os, depth, "Operand:") << '\n';
    operand->Print(os, depth + 1) << '\n';
    return PrintPostfix(os, depth);
}

BinaryExpression::BinaryExpression(Token p_op, std::unique_ptr<Expression>&& p_left, std::unique_ptr<Expression>&& p_right)
    : op(std::move(p_op)), left(std::move(p_left)), right(std::move(p_right))
{
    start = left->start;
    assert(IsOperator(op.type));
}

std::ostream& BinaryExpression::Print(std::ostream& os, ParserDepthT depth) const
{
    PrintAtDepth(os, depth++, "BinaryExpression") << '\n';
    PrintAtDepth(os, depth, "Operator: ") << magic_enum::enum_name(op.type) << '\n';
    PrintAtDepth(os, depth, "Left:") << '\n';
    left->Print(os, depth + 1) << '\n';
    PrintAtDepth(os, depth, "Right:") << '\n';
    right->Print(os, depth + 1) << '\n';
    return PrintPostfix(os, depth);
}

std::ostream& MakeExpression::Print(std::ostream& os, ParserDepthT depth) const
{
    PrintAtDepth(os, depth++, "MakeExpression") << '\n';
    PrintStart(os, depth) << '\n';
    return PrintConstructionExpression_Internal(construction, os, depth);
}

std::ostream& SizeOfExpression::Print(std::ostream& os, ParserDepthT depth) const
{
    PrintAtDepth(os, depth++, "SizeOfExpression") << '\n';
    PrintStart(os, depth) << '\n';

    if (const Type* typePtr = std::get_if<Type>(&type))
    {
        PrintAtDepth(os, depth, "Type:") << '\n';
        return typePtr->Print(os, depth + 1);
    }

    PrintAtDepth(os, depth, "Value:") << '\n';
    return std::get<std::unique_ptr<Expression>>(type)->Print(os, depth + 1);
}

struct BindingPower
{
    using ValueT = float;

    ValueT left;
    ValueT right;

    BindingPower(const ValueT value, const bool isLeftAssociative)
    {
        const float precedenceAdjustment = isLeftAssociative ? .1f : -.1f;
        left = value;
        right = value + precedenceAdjustment;
    }

    BindingPower(const ValueT value) : BindingPower(value, true)
    {
    }
};

static std::optional<BindingPower> GetInfixBindingPower(const TokenType type)
{
    if (IsAssignmentOperator(type))
        return BindingPower{ 1.f, false };

    switch (type)
    {
    case TokenType::OP_RANGE:
        return { -1.f };
    case TokenType::OP_LOGICAL_OR:
        return { 2.f };
    case TokenType::OP_LOGICAL_AND:
        return { 3.f };
    case TokenType::OP_BITWISE_OR:
        return { 4.f };
    case TokenType::OP_BITWISE_XOR:
        return { 5.f };
    case TokenType::OP_BITWISE_AND:
        return { 6.f };
    case TokenType::OP_EQUAL:
    case TokenType::OP_NOT_EQUAL:
        return { 7.f };
    case TokenType::OP_GREATER:
    case TokenType::OP_GREATER_EQUAL:
    case TokenType::OP_LESS:
    case TokenType::OP_LESS_EQUAL:
        return { 8.f };
    case TokenType::OP_BITWISE_LSHIFT:
    case TokenType::OP_BITWISE_RSHIFT:
        return { 9.f };
    case TokenType::OP_PLUS:
    case TokenType::OP_MINUS:
        return { 10.f };
    case TokenType::OP_MUL:
    case TokenType::OP_DIV:
    case TokenType::OP_MOD:
        return { 11.f };
    default:
        return std::nullopt;
    }
}

static bool RequireExpression(TokenStream& stream, std::unique_ptr<Expression>& out, BindingPower::ValueT minBindingPower);

static bool ParseArrayLiteralExpression(TokenStream& stream, std::unique_ptr<Expression>& out)
{
    out = nullptr;

    ArrayLiteralExpression arrLit{};
    if (!stream.Expect(TokenType::LBRACKET, arrLit.start))
        return false;

    Token token;
    if (stream.ConsumeIf(TokenType::RBRACKET, token))
    {
        out = std::make_unique<ArrayLiteralExpression>(std::move(arrLit));
        return true;
    }

    while (!stream.Is(TokenType::RBRACKET))
    {
        if (stream.Is(TokenType::TOKEN_EOF))
        {
            LogError(token, "Unclosed array literal");
            return false;
        }

        std::unique_ptr<Expression> element;
        if (!RequireExpression(stream, element, true))
            return false;

        arrLit.elements.emplace_back(std::move(element));

        const auto isCommaOrRBracket = [](const TokenType type) { return type == TokenType::COMMA || type == TokenType::RBRACKET; };
        if (!stream.Expect(isCommaOrRBracket, token, "Expected ',' or ']'"))
            return false;

        if (token.type == TokenType::RBRACKET)
            break;
    }

    out = std::make_unique<ArrayLiteralExpression>(std::move(arrLit));
    return true;
}

static bool ParseUnaryExpression(TokenStream& stream, std::unique_ptr<Expression>& out)
{
    out = nullptr;

    Token token;
    if (!stream.Expect(IsUnaryOperator, token, "Expected unary operator"))
        return false;

    std::unique_ptr<Expression> operand;
    if (!RequireExpression(stream, operand, FLT_MAX) )
        return false;

    out = std::make_unique<UnaryExpression>(token, std::move(operand));
    return true;
}

static bool ParseParenthesizedExpression(TokenStream& stream, std::unique_ptr<Expression>& out)
{
    Token token;
    out = nullptr;
    return stream.Expect(TokenType::LPAREN, token) && RequireExpression(stream, out) && stream.Expect(TokenType::RPAREN, token);
}

static bool ParseConstructionExpression(TokenStream& stream, std::unique_ptr<Expression>& out)
{
    out = nullptr;

    ConstructionExpression construct{};
    if (!ParseType(stream, construct.type))
        return false;

    construct.start = construct.type.base;
    const auto& modifiers = construct.type.modifiers;

    std::unique_ptr<Postfix> call;
    if ((modifiers.empty() || !IsArrayModifier(modifiers.back()->type)) && !ParseCallPostfix(stream, call))
        return false;

    if (const auto callPtr = dynamic_cast<Call*>(call.get()))
    {
        construct.arguments = std::move(callPtr->arguments);
    }

    const Token token = stream.Peek();
    if (ParsePostfix(stream, call))
    {
        LogError(token, "Unexpected postfix");
        return false;
    }

    out = std::make_unique<ConstructionExpression>(std::move(construct));
    return true;
}

static bool ParseMakeExpression(TokenStream& stream, std::unique_ptr<Expression>& out)
{
    out = nullptr;

    MakeExpression makeExpr{};
    if (!stream.Expect(TokenType::KW_MAKE, makeExpr.start))
        return false;

    std::unique_ptr<Expression> construction;
    if (!ParseConstructionExpression(stream, construction))
        return false;

    makeExpr.construction = std::move(dynamic_cast<ConstructionExpression&>(*construction));
    out = std::make_unique<MakeExpression>(std::move(makeExpr));
    return true;
}

static bool ParseSizeofExpression(TokenStream& stream, std::unique_ptr<Expression>& out)
{
    out = nullptr;

    SizeOfExpression sizeOfExpr{};
    if (!stream.Expect(TokenType::KW_SIZEOF, sizeOfExpr.start))
        return false;

    Token token = stream.Peek();
    if (token.type == TokenType::LPAREN && IsBuiltInType(stream.PeekNext().type))
    {
        stream.Consume(); // LParen

        Type type;
        if (!ParseType(stream, type))
            return false;

        if (!stream.Expect(TokenType::RPAREN, token))
            return false;

        sizeOfExpr.type = std::move(type);
    }
    else
    {
        std::unique_ptr<Expression> expr;
        if (!ParseParenthesizedExpression(stream, expr))
            return false;

        sizeOfExpr.type = std::move(expr);
    }

    out = std::make_unique<SizeOfExpression>(std::move(sizeOfExpr));
    return true;
}

static bool RequireExpression(TokenStream& stream, std::unique_ptr<Expression>& out, BindingPower::ValueT minBindingPower);

static ParseResult ParseExpression(TokenStream& stream, std::unique_ptr<Expression>& out, const BindingPower::ValueT minBindingPower)
{
    out = nullptr;
    Token token = stream.Peek();

    std::unique_ptr<Expression> lhs;
    if (stream.ConsumeIf(IsLiteral, token) || stream.ConsumeIf(TokenType::IDENTIFIER, token))
    {
        lhs = std::make_unique<LiteralExpression>(token);
    }
    else if (token.type == TokenType::LBRACKET)
    {
        if (!ParseArrayLiteralExpression(stream, lhs))
            return ParseResult::Failure;
    }
    else if (token.type == TokenType::LPAREN)
    {
        if (!ParseParenthesizedExpression(stream, lhs))
            return ParseResult::Failure;
    }
    else if (IsUnaryOperator(token.type))
    {
        if (!ParseUnaryExpression(stream, lhs))
            return ParseResult::Failure;
    }
    else if (IsBuiltInType(token.type))
    {
        if (!ParseConstructionExpression(stream, lhs))
            return ParseResult::Failure;
    }
    else if (token.type == TokenType::KW_MAKE)
    {
        if (!ParseMakeExpression(stream, lhs))
            return ParseResult::Failure;
    }
    else if (token.type == TokenType::KW_SIZEOF)
    {
        if (!ParseSizeofExpression(stream, lhs))
            return ParseResult::Failure;
    }
    else
    {
        return ParseResult::None;
    }

    if (const auto postfixLhs = dynamic_cast<PostfixExpression*>(lhs.get()))
    {
        std::unique_ptr<Postfix> postfix;
        while (ParsePostfix(stream, postfix))
            postfixLhs->postfix.emplace_back(std::move(postfix));
    }

    for (;;)
    {
        token = stream.Peek();
        if (!IsOperator(token.type))
            break;

        const std::optional<BindingPower> bindingPower = GetInfixBindingPower(token.type);
        if (!bindingPower)
        {
            LogError(token, "Expected infix operator");
            return ParseResult::Failure;
        }

        if (bindingPower->left < minBindingPower)
            break;

        stream.Consume();
        std::unique_ptr<Expression> rhs;
        if (!RequireExpression(stream, rhs, bindingPower->right))
            return ParseResult::Failure;

        lhs = std::make_unique<BinaryExpression>(token, std::move(lhs), std::move(rhs));
    }

    if (!lhs)
        return ParseResult::Failure;

    out = std::move(lhs);
    return ParseResult::Success;
}

static bool RequireExpression(TokenStream& stream, std::unique_ptr<Expression>& out, const BindingPower::ValueT minBindingPower)
{
    const ParseResult result = ParseExpression(stream, out, minBindingPower);
    if (result == ParseResult::Success)
        return true;

    if (result == ParseResult::None)
        LogError(stream.Peek(), "Expected expression");

    return false;
}

ParseResult ParseExpression(TokenStream& stream, std::unique_ptr<Expression>& out)
{
    return ParseExpression(stream, out, 0);
}

bool RequireExpression(TokenStream& stream, std::unique_ptr<Expression>& out, const bool allowRange)
{
    static const BindingPower rangeBindingPower = *GetInfixBindingPower(TokenType::OP_RANGE);
    return RequireExpression(stream, out, allowRange ? rangeBindingPower.left - .1f : rangeBindingPower.right + .1f);
}

bool RequireExpression(TokenStream& stream, std::unique_ptr<Expression>& out)
{
    return RequireExpression(stream, out, false);
}
