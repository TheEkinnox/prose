#pragma once
#include "lexer/token_type.h"
#include "parser/fwd.h"

#include <vector>

class TokenStream
{
public:
    explicit TokenStream(const std::vector<Token>& tokens);

    [[nodiscard]] const Token& Peek() const;
    [[nodiscard]] const Token& PeekNext() const;

    const Token& Consume();
    bool ConsumeIf(TokenType type, Token& out);

    [[nodiscard]] bool Is(TokenType type) const;
    [[nodiscard]] bool Expect(TokenType type, Token& out);

private:
    const std::vector<Token>& m_tokens;
    size_t m_index;
};
