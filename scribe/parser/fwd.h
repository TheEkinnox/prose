#pragma once
#include <cstdint>

struct Token;
struct Type;

class TokenStream;

struct Statement;
struct Declaration;
struct Expression;
struct PostfixExpression;
struct Postfix;

using ParserDepthT = uint8_t;

enum class ParseResult : uint8_t
{
    Failure,
    Success,
    None
};
