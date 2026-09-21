#include "expressions.h"

#include "parser/parser.h"
#include "parser/postfix.h"
#include "parser/token_stream.h"

#include "utility/strings.h"

#include <optional>

std::ostream& PostfixExpression::Print(std::ostream& os, ParserDepthT depth) const
{
    PrintAtDepth(os, depth, "Postfix:");
    if (postfix.empty())
        return os << " None";

    for (const auto& postfixOperation : postfix)
        postfixOperation->Print(os << '\n', depth + 1);

    return os;
}

std::ostream& LiteralExpression::Print(std::ostream& os, const ParserDepthT depth) const
{
    PrintAtDepth(os, depth, token) << '\n';
    return PostfixExpression::Print(os, depth);
}

std::ostream& ArrayLiteralExpression::Print(std::ostream& os, ParserDepthT depth) const
{
    PrintAtDepth(os, depth++, "ArrayLiteralExpression") << '\n';
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

    return PostfixExpression::Print(os << '\n', depth);
}

static std::ostream& PrintConstructionExpression_Internal(const ConstructionExpression& expression, std::ostream& os, ParserDepthT depth)
{
    PrintAtDepth(os, depth, "Type: ") << '\n';
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
    PrintConstructionExpression_Internal(*this, os, depth) << '\n';
    return PostfixExpression::Print(os, depth);
}

UnaryExpression::UnaryExpression(const Token p_op, std::unique_ptr<Expression>&& p_operand) : op(p_op), operand(std::move(p_operand))
{
}

std::ostream& UnaryExpression::Print(std::ostream& os, ParserDepthT depth) const
{
    PrintAtDepth(os, depth++, "UnaryExpression") << '\n';
    PrintAtDepth(os, depth, "Operator: ") << op.type._to_string() << '\n';
    PrintAtDepth(os, depth, "Operand: ") << '\n';
    operand->Print(os, depth + 1) << '\n';
    return PostfixExpression::Print(os, depth);
}

BinaryExpression::BinaryExpression(Token p_op, std::unique_ptr<Expression>&& p_left, std::unique_ptr<Expression>&& p_right)
    : op(p_op), left(std::move(p_left)), right(std::move(p_right))
{
}

std::ostream& BinaryExpression::Print(std::ostream& os, ParserDepthT depth) const
{
    PrintAtDepth(os, depth++, "BinaryExpression") << '\n';
    PrintAtDepth(os, depth, "Operator: ") << op.type._to_string() << '\n';
    PrintAtDepth(os, depth, "Left: ") << '\n';
    left->Print(os, depth + 1) << '\n';
    PrintAtDepth(os, depth, "Right: ") << '\n';
    right->Print(os, depth + 1) << '\n';
    return PostfixExpression::Print(os, depth);
}

MakeExpression::MakeExpression(ConstructionExpression&& p_construction) : construction(std::move(p_construction))
{
}

std::ostream& MakeExpression::Print(std::ostream& os, ParserDepthT depth) const
{
    PrintAtDepth(os, depth++, "MakeExpression") << '\n';
    return PrintConstructionExpression_Internal(construction, os, depth);
}

SizeOfExpression::~SizeOfExpression()
{
    if (isBuiltInType)
        return;

    expression.reset();
}

std::ostream& SizeOfExpression::Print(std::ostream& os, ParserDepthT depth) const
{
    PrintAtDepth(os, depth++, "SizeOfExpression") << '\n';
    PrintAtDepth(os, depth, "Expression: ") << '\n';
    return expression->Print(os, depth + 1);
}

struct BindingPower
{
    using ValueT = float;

    ValueT left;
    ValueT right;

    BindingPower(const ValueT max) : left(max - .1f), right(max)
    {
    }
};

static std::optional<BindingPower> GetInfixBindingPower(const Token& token)
{
    if (IsAssignmentOperator(token.type))
        return { 1.f };

    switch (token.type)
    {
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
        LogError(token, "Expected infix operator");
        return std::nullopt;
    }
}

static bool ParseArrayLiteralExpression(TokenStream& stream, std::unique_ptr<Expression>& out)
{
    out = nullptr;

    Token token;
    if (!stream.Expect(TokenType::LBRACKET, token))
        return false;

    ArrayLiteralExpression arrLit;
    while (!stream.Is(TokenType::RBRACKET))
    {
        if (stream.Is(TokenType::TOKEN_EOF))
        {
            LogError(token, "Unclosed array literal");
            return false;
        }

        std::unique_ptr<Expression> element;
        if (!ParseExpression(stream, element))
            return false;

        arrLit.elements.emplace_back(std::move(element));

        if (stream.Is(TokenType::COMMA))
        {
            stream.Consume();
        }
        else if (!stream.Is(TokenType::RBRACKET))
        {
            LogError(token, "Expected ',' or ']'");
            return false;
        }
    }

    stream.Consume();
    out = std::make_unique<ArrayLiteralExpression>(std::move(arrLit));
    return true;
}

static bool ParseUnaryExpression(TokenStream& stream, std::unique_ptr<Expression>& out)
{
    out = nullptr;
    Token token = stream.Peek();

    if (!IsUnaryOperator(token.type))
    {
        LogError(token, "Expected unary operator");
        return false;
    }

    stream.Consume();

    std::unique_ptr<Expression> operand;
    if (!ParseExpression(stream, operand))
        return false;

    out = std::make_unique<UnaryExpression>(token, std::move(operand));
    return true;
}

static bool ParseParenthesizedExpression(TokenStream& stream, std::unique_ptr<Expression>& out)
{
    Token token;
    return stream.Expect(TokenType::LPAREN, token) && ParseExpression(stream, out) && stream.Expect(TokenType::RPAREN, token);
}

static bool ParseConstructionExpression(TokenStream& stream, std::unique_ptr<Expression>& out)
{
    out = nullptr;

    ConstructionExpression construct;
    if (!ParseType(stream, construct.type))
        return false;

    const auto& modifiers = construct.type.modifiers;

    std::unique_ptr<Postfix> call;
    if ((modifiers.empty() || !IsArrayModifier(modifiers.back()->type)) && !ParseCallPostfix(stream, call))
        return false;

    Call* callPtr = dynamic_cast<Call*>(call.get());
    if (callPtr != nullptr)
    {
        construct.arguments = std::move(callPtr->arguments);
    }

    Token token = stream.Peek();
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

    Token token;
    if (!stream.Expect(TokenType::KW_MAKE, token))
        return false;

    std::unique_ptr<Expression> construction;
    if (!ParseConstructionExpression(stream, construction))
        return false;

    auto& constructionExpression = dynamic_cast<ConstructionExpression&>(*construction);
    out = std::make_unique<MakeExpression>(std::move(constructionExpression));
    return true;
}

static bool ParseSizeofExpression(TokenStream& stream, std::unique_ptr<Expression>& out)
{
    out = nullptr;

    Token token;
    if (!stream.Expect(TokenType::KW_SIZEOF, token))
        return false;

    auto sizeOfExpr = std::make_unique<SizeOfExpression>();

    token = stream.Peek();
    sizeOfExpr->isBuiltInType = token.type == TokenType::LPAREN && IsBuiltInType(stream.PeekNext().type);

    if (sizeOfExpr->isBuiltInType)
    {
        stream.Consume();
        stream.Consume();

        if (!stream.Expect(TokenType::RPAREN, token))
            return false;
    }
    else if (!ParseParenthesizedExpression(stream, sizeOfExpr->expression))
        return false;

    out = std::move(sizeOfExpr);
    return true;
}

static bool ParseExpression(TokenStream& stream, std::unique_ptr<Expression>& out, const BindingPower::ValueT minBindingPower)
{
    out = nullptr;
    Token token = stream.Peek();

    std::unique_ptr<Expression> lhs;
    if (IsLiteral(token.type) || token.type == TokenType::IDENTIFIER)
    {
        stream.Consume();

        LiteralExpression lit;
        lit.token = token;
        lhs = std::make_unique<LiteralExpression>(std::move(lit));
    }
    else if (token.type == TokenType::LBRACKET)
    {
        if (!ParseArrayLiteralExpression(stream, lhs))
            return false;
    }
    else if (token.type == TokenType::LPAREN)
    {
        if (!ParseParenthesizedExpression(stream, lhs))
            return false;
    }
    else if (IsOperator(token.type))
    {
        if (!ParseUnaryExpression(stream, lhs))
            return false;
    }
    else if (IsBuiltInType(token.type))
    {
        if (!ParseConstructionExpression(stream, lhs))
            return false;
    }
    else if (token.type == TokenType::KW_MAKE)
    {
        if (!ParseMakeExpression(stream, lhs))
            return false;
    }
    else if (token.type == TokenType::KW_SIZEOF)
    {
        if (!ParseSizeofExpression(stream, lhs))
            return false;
    }
    else
    {
        LogError(token, "Expected expression");
        return false;
    }

    auto postfixLhs = dynamic_cast<PostfixExpression*>(lhs.get());
    if (postfixLhs != nullptr)
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

        const std::optional<BindingPower> bp = GetInfixBindingPower(token);

        if (!bp)
            return false;

        if (bp->left < minBindingPower)
            break;

        stream.Consume();
        std::unique_ptr<Expression> rhs;
        if (!ParseExpression(stream, rhs, bp->right))
            return false;

        lhs = std::make_unique<BinaryExpression>(token, std::move(lhs), std::move(rhs));
    }

    if (lhs == nullptr)
    {
        LogError(token, "Expected expression");
        return false;
    }

    out = std::move(lhs);
    return true;
}

bool ParseExpression(TokenStream& stream, std::unique_ptr<Expression>& out)
{
    return ParseExpression(stream, out, 0.f);
}
