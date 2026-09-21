#pragma once
#include "utility/macros.h"

#include "external/better_enums/enum.h"

#include <cstdint>

CLANG_IGNORE_WARNING_PUSH("-Wglobal-constructors")
BETTER_ENUM(TokenType, uint8_t,
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
    OP_MUL,
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
    SEMICOLON,
    COMMA,
    DOT,
    NEWLINE,
    COMMENT,
    TOKEN_EOF
);
CLANG_IGNORE_WARNING_POP

inline bool IsBuiltInType(const TokenType type)
{
    return std::string_view(type._to_string()).starts_with("T_");
}

inline bool IsLiteral(const TokenType type)
{
    return std::string_view(type._to_string()).starts_with("LIT_")
        || type == TokenType::KW_NULL || type == TokenType::KW_TRUE || type == TokenType::KW_FALSE;
}

inline bool IsOperator(const TokenType type)
{
    return std::string_view(type._to_string()).starts_with("OP_") || type == TokenType::KW_MOVE;
}

inline bool IsAssignmentOperator(const TokenType type)
{
    return std::string_view(type._to_string()).starts_with("OP_ASSIGN");
}

inline bool IsUnaryOperator(const TokenType type)
{
    return type._enum == TokenType::OP_INC
        || type._enum == TokenType::OP_DEC
        || type._enum == TokenType::OP_MINUS
        || type._enum == TokenType::OP_LOGICAL_NOT
        || type._enum == TokenType::OP_BITWISE_NOT
        || type._enum == TokenType::OP_ADDRESS_OF
        || type._enum == TokenType::KW_MOVE;
}

inline bool IsTerminator(const TokenType type)
{
    return type._enum == TokenType::SEMICOLON || type._enum == TokenType::NEWLINE || type._enum == TokenType::KW_END || type._enum == TokenType::TOKEN_EOF;
}
