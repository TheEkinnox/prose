#include "lexer.h"

#include <algorithm>
#include <cassert>
#include <cctype>
#include <iostream>

struct Cursor
{
    std::string_view source;
    size_t pos;
    size_t line = 1;
    size_t column = 1;

    char Peek() const;
    char Peek(uint32_t offset) const;
    char Consume();
    bool ConsumeIf(char c);
};

char Cursor::Peek() const
{
    return Peek(0);
}

char Cursor::Peek(const uint32_t offset) const
{
    return pos + offset < source.size() ? source[pos + offset] : '\0';
}

char Cursor::Consume()
{
    if (pos >= source.size())
        return '\0';

    const char current = source[pos++];
    ++column;

    if (current == '\r')
    {
        if (source[pos] == '\n')
        {
            ++pos;
        }

        ++line;
        column = 1;
        return '\n';
    }

    if (current == '\n')
    {
        ++line;
        column = 1;
    }

    return current;
}

bool Cursor::ConsumeIf(const char c)
{
    if (Peek() == c)
    {
        Consume();
        return true;
    }

    return false;
}

static bool GetBuiltInType(const std::string_view token, TokenType& out)
{
    out = TokenType::UNKNOWN;

    if (token == "i8")
        out = TokenType::T_I8;
    else if (token == "u8")
        out = TokenType::T_U8;
    else if (token == "i16")
        out = TokenType::T_I16;
    else if (token == "u16")
        out = TokenType::T_U16;
    else if (token == "i32")
        out = TokenType::T_I32;
    else if (token == "u32")
        out = TokenType::T_U32;
    else if (token == "i64")
        out = TokenType::T_I64;
    else if (token == "u64")
        out = TokenType::T_U64;
    else if (token == "iptr")
        out = TokenType::T_IPTR;
    else if (token == "uptr")
        out = TokenType::T_UPTR;
    else if (token == "f32")
        out = TokenType::T_F32;
    else if (token == "f64")
        out = TokenType::T_F64;
    else if (token == "byte")
        out = TokenType::T_BYTE;
    else if (token == "bool")
        out = TokenType::T_BOOL;
    else if (token == "rune")
        out = TokenType::T_RUNE;
    else if (token == "string")
        out = TokenType::T_STRING;
    else if (token == "void")
        out = TokenType::T_VOID;

    return out != TokenType::UNKNOWN;
}

static bool GetKeyword(const std::string_view token, TokenType& out)
{
    if (token == "null")
        out = TokenType::KW_NULL;
    else if (token == "true")
        out = TokenType::KW_TRUE;
    else if (token == "false")
        out = TokenType::KW_FALSE;
    else if (token == "sizeof")
        out = TokenType::KW_SIZEOF;
    else if (token == "fn")
        out = TokenType::KW_FN;
    else if (token == "scope")
        out = TokenType::KW_SCOPE;
    else if (token == "defer")
        out = TokenType::KW_DEFER;
    else if (token == "make")
        out = TokenType::KW_MAKE;
    else if (token == "return")
        out = TokenType::KW_RETURN;
    else if (token == "end")
        out = TokenType::KW_END;
    else if (token == "if")
        out = TokenType::KW_IF;
    else if (token == "else")
        out = TokenType::KW_ELSE;
    else if (token == "switch")
        out = TokenType::KW_SWITCH;
    else if (token == "case")
        out = TokenType::KW_CASE;
    else if (token == "fallthrough")
        out = TokenType::KW_FALLTHROUGH;
    else if (token == "default")
        out = TokenType::KW_DEFAULT;
    else if (token == "for")
        out = TokenType::KW_FOR;
    else if (token == "in")
        out = TokenType::KW_IN;
    else if (token == "break")
        out = TokenType::KW_BREAK;
    else if (token == "continue")
        out = TokenType::KW_CONTINUE;
    else if (token == "while")
        out = TokenType::KW_WHILE;
    else if (token == "repeat")
        out = TokenType::KW_REPEAT;
    else if (token == "until")
        out = TokenType::KW_UNTIL;
    else if (token == "const")
        out = TokenType::KW_CONST;
    else if (token == "type")
        out = TokenType::KW_TYPE;
    else if (token == "enum")
        out = TokenType::KW_ENUM;
    else if (token == "alias")
        out = TokenType::KW_ALIAS;
    else if (token == "move")
        out = TokenType::KW_MOVE;
    else
        out = TokenType::UNKNOWN;

    return out != TokenType::UNKNOWN;
}

static bool IsIdentifier(const std::string_view token)
{
    if (token.empty())
        return false;

    if (!std::isalpha(token[0]) && token[0] != '_')
        return false;

    return token.size() == 1 || std::ranges::all_of(token.substr(1), [](const char c)
    {
        return std::isalpha(c) || std::isdigit(c) || c == '_';
    });
}

static bool IsIntLiteral(const std::string_view token)
{
    if (token.empty())
        return false;

    return std::isdigit(token[0]) && (token.size() == 1 || std::ranges::all_of(token.substr(1), [](const char c)
    {
        return std::isdigit(c) || c == '\'';
    }));
}

static bool IsFloatLiteral(const std::string_view token)
{
    if (token.empty())
        return false;

    const auto dotIndex = token.find('.');
    if (dotIndex == std::string::npos)
        return false;

    const std::string_view integerPart = token.substr(0, dotIndex);
    const std::string_view decimalPart = token.substr(dotIndex + 1);

    if (integerPart.empty() && decimalPart.empty())
        return false;

    if (!integerPart.empty() && !IsIntLiteral(integerPart))
        return false;

    if (!decimalPart.empty() && !IsIntLiteral(decimalPart))
        return false;

    return true;
}

static bool IsRuneLiteral(const std::string_view token)
{
    if (token.size() < 3)
        return false;

    if (token.front() != '\'' || token.back() != '\'')
        return false;

    // Note: not validating the rune character itself - this will be handled with semantic analysis
    return token.size() >= 3 && token.front() == '\'' && token.back() == '\'';
}

static bool IsStringLiteral(const std::string_view token)
{
    // Note: not validating the string's content - this will be handled with semantic analysis
    return token.size() >= 2 && token.front() == '"' && token.back() == '"';
}

Token::Token(const std::string_view p_value, const size_t p_line, const size_t p_column) : type(TokenType::UNKNOWN), value(p_value), line(p_line), column(p_column)
{
    if (value.empty())
        return;

    if (!GetBuiltInType(value, type) && !GetKeyword(value, type) && IsIdentifier(value))
        type = TokenType::IDENTIFIER;
    else if (IsIntLiteral(value))
        type = TokenType::LIT_INTEGER;
    else if (IsFloatLiteral(value))
        type = TokenType::LIT_FLOATING_POINT;
    else if (IsRuneLiteral(value))
        type = TokenType::LIT_RUNE;
    else if (IsStringLiteral(value))
        type = TokenType::LIT_STRING;
    else if (value == "+")
        type = TokenType::OP_PLUS;
    else if (value == "-")
        type = TokenType::OP_MINUS;
    else if (value == "*")
        type = TokenType::OP_MUL;
    else if (value == "/")
        type = TokenType::OP_DIV;
    else if (value == "%")
        type = TokenType::OP_MOD;
    else if (value == "++")
        type = TokenType::OP_INC;
    else if (value == "--")
        type = TokenType::OP_DEC;
    else if (value == "..")
        type = TokenType::OP_RANGE;
    else if (value == "!")
        type = TokenType::OP_LOGICAL_NOT;
    else if (value == "==")
        type = TokenType::OP_EQUAL;
    else if (value == "!=")
        type = TokenType::OP_NOT_EQUAL;
    else if (value == ">")
        type = TokenType::OP_GREATER;
    else if (value == ">=")
        type = TokenType::OP_GREATER_EQUAL;
    else if (value == "<")
        type = TokenType::OP_LESS;
    else if (value == "<=")
        type = TokenType::OP_LESS_EQUAL;
    else if (value == "&&")
        type = TokenType::OP_LOGICAL_AND;
    else if (value == "||")
        type = TokenType::OP_LOGICAL_OR;
    else if (value == "~")
        type = TokenType::OP_BITWISE_NOT;
    else if (value == "&")
        type = TokenType::OP_BITWISE_AND;
    else if (value == "|")
        type = TokenType::OP_BITWISE_OR;
    else if (value == "^")
        type = TokenType::OP_BITWISE_XOR;
    else if (value == "<<")
        type = TokenType::OP_BITWISE_LSHIFT;
    else if (value == ">>")
        type = TokenType::OP_BITWISE_RSHIFT;
    else if (value == "=")
        type = TokenType::OP_ASSIGN;
    else if (value == "+=")
        type = TokenType::OP_ASSIGN_ADD;
    else if (value == "-=")
        type = TokenType::OP_ASSIGN_SUB;
    else if (value == "*=")
        type = TokenType::OP_ASSIGN_MUL;
    else if (value == "/=")
        type = TokenType::OP_ASSIGN_DIV;
    else if (value == "%=")
        type = TokenType::OP_ASSIGN_MOD;
    else if (value == "&=")
        type = TokenType::OP_ASSIGN_AND;
    else if (value == "|=")
        type = TokenType::OP_ASSIGN_OR;
    else if (value == "^=")
        type = TokenType::OP_ASSIGN_XOR;
    else if (value == "<<=")
        type = TokenType::OP_ASSIGN_LSHIFT;
    else if (value == ">>=")
        type = TokenType::OP_ASSIGN_RSHIFT;
    else if (value == "@")
        type = TokenType::OP_ADDRESS_OF;
    else if (value == "(")
        type = TokenType::LPAREN;
    else if (value == ")")
        type = TokenType::RPAREN;
    else if (value == "[")
        type = TokenType::LBRACKET;
    else if (value == "]")
        type = TokenType::RBRACKET;
    else if (value == ":")
        type = TokenType::COLON;
    else if (value == ";")
        type = TokenType::SEMICOLON;
    else if (value == ",")
        type = TokenType::COMMA;
    else if (value == ".")
        type = TokenType::DOT;
    else if (value == "\n")
        type = TokenType::NEWLINE;
}

Token::Token(const TokenType p_type, const std::string_view p_value, const size_t p_line, const size_t p_column) : type(p_type), value(p_value), line(p_line), column(p_column)
{
    assert(p_type != TokenType::UNKNOWN);
    assert(p_type == TokenType::TOKEN_EOF || !p_value.empty());
}

std::ostream& Token::Print(std::ostream& os) const
{
    return os << type._to_string() << (value.empty() ? "" : "(" + std::string(value) + ")");
}

bool Tokenize(const std::string_view source, std::vector<Token>& tokensOut)
{
    tokensOut.clear();

    if (source.empty())
    {
        tokensOut.emplace_back(TokenType::TOKEN_EOF, "", 1, 1);
        return true;
    }

    tokensOut.reserve(source.size() / 4);

    Cursor cursor{ source, 0, 1, 1 };

    while (cursor.Peek() != '\0')
    {
        Cursor tokenStart = cursor;

        switch (cursor.Consume())
        {
        case '"':
        {
            size_t escapeCount = 0;
            while ((cursor.Peek() != '"' || (cursor.Peek() == '\\' && cursor.Peek(1) == '"')) && cursor.Peek() != '\0')
            {
                if (cursor.Peek() == '\\')
                    escapeCount++;
                else
                    escapeCount = 0;

                if (escapeCount > 0 && escapeCount % 2 == 1 && cursor.Peek() == '\\' && cursor.Peek(1) == '"')
                    cursor.Consume();

                cursor.Consume();
            }

            if (!cursor.ConsumeIf('"'))
            {
                // TODO: Properly log warning
                printf("(%zu:%zu) Warning: Unterminated string literal\n", tokenStart.line, tokenStart.column);
                fflush(stdout);
            }

            const std::string_view tokenStr = source.substr(tokenStart.pos, cursor.pos - tokenStart.pos);
            tokensOut.emplace_back(TokenType::LIT_STRING, tokenStr, tokenStart.line, tokenStart.column);
            continue;
        }
        case '\'':
        {
            size_t escapeCount = 0;
            while ((cursor.Peek() != '\'' || (cursor.Peek() == '\\' && cursor.Peek(1) == '\'')) && cursor.Peek() != '\0')
            {
                if (cursor.Peek() == '\\')
                    escapeCount++;
                else
                    escapeCount = 0;

                if (escapeCount > 0 && escapeCount % 2 == 1 && cursor.Peek() == '\\' && cursor.Peek(1) == '\'')
                    cursor.Consume();

                cursor.Consume();
            }

            if (!cursor.ConsumeIf('\''))
            {
                // TODO: Properly log warning
                printf("(%zu:%zu) Warning: Unterminated rune literal\n", tokenStart.line, tokenStart.column);
                fflush(stdout);
            }

            const std::string_view tokenStr = source.substr(tokenStart.pos, cursor.pos - tokenStart.pos);
            tokensOut.emplace_back(TokenType::LIT_RUNE, tokenStr, tokenStart.line, tokenStart.column);
            continue;
        }
        case '/':
            if (cursor.ConsumeIf('/'))
            {
                while (cursor.Peek() != '\r' && cursor.Peek() != '\n' && cursor.Peek() != '\0')
                {
                    cursor.Consume();
                }

                continue;
            }

            if (cursor.ConsumeIf('*'))
            {
                while (cursor.Peek() != '\0' && !(cursor.Peek() == '*' && cursor.Peek(1) == '/'))
                {
                    cursor.Consume();
                }

                if (!cursor.ConsumeIf('*') || !cursor.ConsumeIf('/'))
                {
                    // TODO: Properly log warning
                    printf("(%zu:%zu) Warning: Unterminated block comment\n", tokenStart.line, tokenStart.column);
                    fflush(stdout);
                }

                continue;
            }

            break;
        case '\\':
            if (!cursor.ConsumeIf('\r') && !cursor.ConsumeIf('\n'))
            {
                // TODO: Properly log error
                fprintf(stderr, "(%zu:%zu) Error: Invalid escape sequence. Expected '\\n', Received '%c'\n", cursor.line, cursor.column, cursor.Peek());
                fflush(stderr);
                return false;
            }
            continue;
        case '\n':
            tokensOut.emplace_back(TokenType::NEWLINE, "\n", tokenStart.line, tokenStart.column);
            continue;
        default:
            break;
        }

        if (std::isspace(tokenStart.Peek()))
            continue;

        const std::string_view tokenStr = source.substr(tokenStart.pos, cursor.pos - tokenStart.pos);
        Token token(tokenStr, tokenStart.line, tokenStart.column);
        if (token.type == TokenType::UNKNOWN)
        {
            // TODO: Properly log warning
            printf("(%zu:%zu) Warning: Unknown token '%.*s'\n", token.line, token.column, static_cast<int>(tokenStr.size()), tokenStr.data());
            fflush(stdout);
            continue;
        }

        while (cursor.Peek() != '\0')
        {
            // Special case for integer literals followed by the range operator
            // This prevents the lexer from treating "1..2" as the floats "1." and ".2"
            if (token.type == TokenType::LIT_INTEGER && cursor.Peek() == '.' && cursor.Peek(1) == '.')
                break;

            const std::string_view nextTokenStr = source.substr(tokenStart.pos, cursor.pos + 1 - tokenStart.pos);
            const Token nextToken(nextTokenStr, tokenStart.line, tokenStart.column);

            if (nextToken.type == TokenType::UNKNOWN)
                break;

            token = nextToken;
            cursor.Consume();
        }

        tokensOut.push_back(token);
    }

    tokensOut.emplace_back(TokenType::TOKEN_EOF, "", cursor.line, cursor.column);
    return true;
}
