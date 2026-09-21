#include "token_stream.h"

#include "lexer/lexer.h"
#include "parser/parser.h"

#include <cassert>

TokenStream::TokenStream(const std::vector<Token>& tokens) : m_tokens{ tokens }, m_index{ 0 }
{
    assert(!tokens.empty());
    assert(tokens.back().type == TokenType::TOKEN_EOF);
}

static const Token& Peek_Impl(const std::vector<Token>& tokens, const size_t index, const uint32_t offset)
{
    return tokens[std::min(index + offset, tokens.size() - 1)];
}

const Token& TokenStream::Peek() const
{
    return Peek_Impl(m_tokens, m_index, 0);
}

const Token& TokenStream::PeekNext() const
{
    return Peek_Impl(m_tokens, m_index, 1);
}

bool TokenStream::Is(const TokenType type) const
{
    return Peek().type == type;
}

const Token& TokenStream::Consume()
{
    const Token& token = Peek();

    if (token.type != TokenType::TOKEN_EOF)
        ++m_index;

    return token;
}

bool TokenStream::ConsumeIf(const TokenType type, Token& out)
{
    if (Is(type))
    {
        out = Consume();
        return true;
    }

    return false;
}

bool TokenStream::Expect(const TokenType type, Token& out)
{
    if (ConsumeIf(type, out))
    {
        return true;
    }

    LogError(Peek(), "Expected " + std::string(type._to_string()));
    return false;
}
