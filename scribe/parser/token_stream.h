#pragma once
#include "lexer/token_type.h"
#include "parser/fwd.h"

#include <functional>
#include <vector>

class TokenStream
{
public:
    explicit TokenStream(const std::vector<Token>& tokens);
    using ConditionFunc = std::function<bool(TokenType)>;

    [[nodiscard]] const Token& Peek() const;
    [[nodiscard]] const Token& PeekNext() const;

    const Token& Consume();
    bool ConsumeIf(TokenType type, Token& out);
    bool ConsumeIf(const ConditionFunc& func, Token& out);

    [[nodiscard]] bool Is(TokenType type) const;
    [[nodiscard]] bool Match(const ConditionFunc& func) const;

    [[nodiscard]] bool Expect(TokenType type, Token& out);
    [[nodiscard]] bool Expect(const ConditionFunc& func, Token& out, std::string_view message);

private:
    const std::vector<Token>& m_tokens;
    size_t m_index;
};
