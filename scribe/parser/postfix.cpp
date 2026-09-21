#include "postfix.h"

#include "parser/parser.h"
#include "parser/expressions.h"
#include "parser/token_stream.h"

#include "utility/strings.h"

Postfix::Postfix(const PostfixType p_type) : type(p_type)
{
}

std::ostream& Postfix::Print(std::ostream& os, const ParserDepthT depth) const
{
    return PrintAtDepth(os, depth, type._to_string());
}

Call::Call() : Postfix(PostfixType::Call)
{
}

std::ostream& Call::Print(std::ostream& os, ParserDepthT depth) const
{
    Postfix::Print(os, depth++) << '\n';
    PrintAtDepth(os, depth, "Arguments:");

    if (arguments.empty())
        return os << " None";

    for (const auto& argument : arguments)
        argument->Print(os << '\n', depth + 1);

    return os;
}

Index::Index(std::unique_ptr<Expression>&& p_index) : Postfix(PostfixType::Index), index(std::move(p_index))
{
}

std::ostream& Index::Print(std::ostream& os, ParserDepthT depth) const
{
    Postfix::Print(os, depth++) << '\n';
    return index->Print(os, depth);
}

Slice::Slice(std::unique_ptr<Expression>&& p_start, std::unique_ptr<Expression>&& p_end)
    : Postfix(PostfixType::Slice), start(std::move(p_start)), end(std::move(p_end))
{
}

std::ostream& Slice::Print(std::ostream& os, ParserDepthT depth) const
{
    Postfix::Print(os, depth++) << '\n';
    PrintAtDepth(os, depth, "Start:");
    if (start)
        start->Print(os << '\n', depth + 1);
    else
        os << " None";

    PrintAtDepth(os << '\n', depth, "End:");
    if (end)
        end->Print(os << '\n', depth + 1);
    else
        os << " None";

    return os;
}

MemberAccess::MemberAccess(Token p_member) : Postfix(PostfixType::MemberAccess), member(std::move(p_member))
{
}

std::ostream& MemberAccess::Print(std::ostream& os, ParserDepthT depth) const
{
    Postfix::Print(os, depth++) << '\n';
    return PrintAtDepth(os, depth, "Member: '") << member.value << '\'';
}

bool ParseCallPostfix(TokenStream& stream, std::unique_ptr<Postfix>& out)
{
    out = nullptr;

    Token token;
    if (!stream.Expect(TokenType::LPAREN, token))
        return false;

    Call call;
    token = stream.Peek();

    while (token.type != TokenType::RPAREN)
    {
        std::unique_ptr<Expression> argument;
        if (!ParseExpression(stream, argument))
            return false;

        call.arguments.emplace_back(std::move(argument));
        token = stream.Peek();

        if (stream.ConsumeIf(TokenType::COMMA, token))
        {
            token = stream.Peek();
            if (token.type == TokenType::RPAREN)
            {
                LogError(token, "Expected expression");
                return false;
            }
        }
    }

    out = std::make_unique<Call>(std::move(call));
    return stream.Expect(TokenType::RPAREN, token);
}

static bool ParseIndexOrSlicePostfix(TokenStream& stream, std::unique_ptr<Postfix>& out)
{
    out = nullptr;
    Token token;
    if (!stream.Expect(TokenType::LBRACKET, token))
        return false;

    token = stream.Peek();

    std::unique_ptr<Expression> indexOrFirst;
    if (token.type != TokenType::COLON && !ParseExpression(stream, indexOrFirst))
        return false;

    if (stream.ConsumeIf(TokenType::COLON, token))
    {
        token = stream.Peek();

        std::unique_ptr<Expression> last;
        if (token.type != TokenType::RBRACKET && !ParseExpression(stream, last))
            return false;

        out = std::make_unique<Slice>(std::move(indexOrFirst), std::move(last));
    }
    else
    {
        out = std::make_unique<Index>(std::move(indexOrFirst));
    }

    return stream.Expect(TokenType::RBRACKET, token);
}

static bool ParseMemberAccessPostfix(TokenStream& stream, std::unique_ptr<Postfix>& out)
{
    out = nullptr;
    Token token;

    if (!stream.Expect(TokenType::DOT, token))
        return false;

    if (!stream.Expect(TokenType::IDENTIFIER, token))
        return false;

    out = std::make_unique<MemberAccess>(std::move(token));
    return true;
}

bool ParsePostfix(TokenStream& stream, std::unique_ptr<Postfix>& out)
{
    out = nullptr;
    switch (stream.Peek().type)
    {
    case TokenType::LPAREN:
        if (!ParseCallPostfix(stream, out))
            return false;
        break;
    case TokenType::LBRACKET:
        if (!ParseIndexOrSlicePostfix(stream, out))
            return false;
        break;
    case TokenType::DOT:
        if (!ParseMemberAccessPostfix(stream, out))
            return false;
        break;
    case TokenType::OP_INC:
        stream.Consume();
        out = std::make_unique<Postfix>(PostfixType::Increment);
        break;
    case TokenType::OP_DEC:
        stream.Consume();
        out = std::make_unique<Postfix>(PostfixType::Decrement);
        break;
    default:
        break;
    }

    return out != nullptr;
}
