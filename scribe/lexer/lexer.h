#pragma once
#include "token_type.h"

#include <string_view>
#include <vector>

struct Token
{
    TokenType type;
    std::string_view value;
    size_t line;
    size_t column;

    Token(std::string_view token, size_t line, size_t column);
    Token(TokenType type, std::string_view value, size_t line, size_t column);
};

std::vector<Token> Tokenize(std::string_view source);
