#pragma once
#include "utility/common.h"
#include "utility/macros.h"
#include "utility/strings.h"

NO_WARNINGS_PUSH
#include "magic_enum/magic_enum.hpp"
NO_WARNINGS_POP

#include <cstdint>

enum class TokenType : uint8_t
{
    UNKNOWN,
    IDENTIFIER,

    T_I8,   T_U8,
    T_I16,  T_U16,
    T_I32,  T_U32,
    T_I64,  T_U64,
    T_IPTR, T_UPTR,
    T_F32,  T_F64,
    T_BYTE,
    T_BOOL,
    T_RUNE,
    T_STRING,
    T_VOID,

    KW_NULL,
    KW_TRUE,
    KW_FALSE,
    KW_SIZEOF,
    KW_FN,
    KW_SCOPE,
    KW_DEFER,
    KW_MAKE,
    KW_RETURN,
    KW_END,
    KW_IF,
    KW_ELSE,
    KW_SWITCH,
    KW_CASE,
    KW_FALLTHROUGH,
    KW_DEFAULT,
    KW_FOR,
    KW_IN,
    KW_BREAK,
    KW_CONTINUE,
    KW_WHILE,
    KW_REPEAT,
    KW_UNTIL,
    KW_CONST,
    KW_TYPE,
    KW_ENUM,
    KW_ALIAS,
    KW_MOVE,

    LIT_INTEGER,
    LIT_FLOATING_POINT,
    LIT_RUNE,
    LIT_STRING,

    OP_PLUS,
    OP_MINUS,
    OP_STAR,
    OP_DIV,
    OP_MOD,
    OP_INC,
    OP_DEC,
    OP_RANGE,
    OP_LOGICAL_NOT,
    OP_EQUAL,
    OP_NOT_EQUAL,
    OP_GREATER,
    OP_GREATER_EQUAL,
    OP_LESS,
    OP_LESS_EQUAL,
    OP_LOGICAL_AND,
    OP_LOGICAL_OR,
    OP_BITWISE_NOT,
    OP_BITWISE_AND,
    OP_BITWISE_OR,
    OP_BITWISE_XOR,
    OP_BITWISE_LSHIFT,
    OP_BITWISE_RSHIFT,
    OP_ASSIGN,
    OP_ASSIGN_ADD,
    OP_ASSIGN_SUB,
    OP_ASSIGN_MUL,
    OP_ASSIGN_DIV,
    OP_ASSIGN_MOD,
    OP_ASSIGN_AND,
    OP_ASSIGN_OR,
    OP_ASSIGN_XOR,
    OP_ASSIGN_LSHIFT,
    OP_ASSIGN_RSHIFT,
    OP_ADDRESS_OF,

    LPAREN,
    RPAREN,
    LBRACKET,
    RBRACKET,
    COLON,
    COMMA,
    DOT,
    TERMINATOR,
    TOKEN_EOF
};

consteval TokenType FindFirstTokenType(const std::string_view prefix)
{
    constexpr auto values = magic_enum::enum_values<TokenType>();
    if (prefix.empty())
        return values[0];

    return *std::ranges::find_if(values, [&](const auto type) { return magic_enum::enum_name(type).starts_with(prefix); });
}

consteval TokenType FindLastTokenType(const std::string_view prefix)
{
    constexpr auto values = magic_enum::enum_values<TokenType>();
    if (prefix.empty())
        return values[0];

    return *std::find_if(values.rbegin(), values.rend(), [&](const auto type) { return magic_enum::enum_name(type).starts_with(prefix); });
}

constexpr std::string_view TOKEN_TYPE_PREFIX = "T_";
constexpr auto TOKEN_FIRST_TYPE = FindFirstTokenType(TOKEN_TYPE_PREFIX);
constexpr auto TOKEN_LAST_TYPE = FindLastTokenType(TOKEN_TYPE_PREFIX);

constexpr std::string_view TOKEN_KEYWORD_PREFIX = "KW_";
constexpr auto TOKEN_FIRST_KEYWORD = TOKEN_FIRST_TYPE;
constexpr auto TOKEN_LAST_KEYWORD = FindLastTokenType(TOKEN_KEYWORD_PREFIX);

constexpr bool IsBuiltInType(const TokenType type)
{
    return Underlying(type) >= Underlying(TOKEN_FIRST_TYPE) && Underlying(type) <= Underlying(TOKEN_LAST_TYPE);
}

constexpr bool IsKeyword(const TokenType type)
{
    return (Underlying(type) >= Underlying(TOKEN_FIRST_KEYWORD) && Underlying(type) <= Underlying(TOKEN_LAST_KEYWORD));
}

inline std::string GetKeyword(const TokenType type)
{
    assert(IsKeyword(type));
    const std::string_view name = magic_enum::enum_name(type);
    return ToLower(name.substr(name.find('_') + 1));
}

constexpr bool IsNumericType(const TokenType type)
{
    return type == TokenType::T_BYTE
        || type == TokenType::T_BOOL
        || magic_enum::enum_name(type).starts_with("T_I")
        || magic_enum::enum_name(type).starts_with("T_U")
        || magic_enum::enum_name(type).starts_with("T_F");
}

constexpr bool IsLiteral(const TokenType type)
{
    return magic_enum::enum_name(type).starts_with("LIT_")
        || type == TokenType::KW_NULL || type == TokenType::KW_TRUE || type == TokenType::KW_FALSE;
}

constexpr bool IsOperator(const TokenType type)
{
    return magic_enum::enum_name(type).starts_with("OP_") || type == TokenType::KW_MOVE;
}

constexpr bool IsAssignmentOperator(const TokenType type)
{
    return magic_enum::enum_name(type).starts_with("OP_ASSIGN");
}

constexpr bool IsUnaryOperator(const TokenType type)
{
    return type == TokenType::OP_INC
        || type == TokenType::OP_DEC
        || type == TokenType::OP_MINUS
        || type == TokenType::OP_STAR
        || type == TokenType::OP_LOGICAL_NOT
        || type == TokenType::OP_BITWISE_NOT
        || type == TokenType::OP_ADDRESS_OF
        || type == TokenType::KW_MOVE;
}

constexpr bool IsTerminatorOrEOF(const TokenType type)
{
    return type == TokenType::TERMINATOR || type == TokenType::TOKEN_EOF;
}

constexpr bool IsSeparator(const TokenType type)
{
    return IsTerminatorOrEOF(type) || type == TokenType::KW_END;
}
