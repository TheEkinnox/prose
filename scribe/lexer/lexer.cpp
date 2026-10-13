#include "lexer.h"

#include "utility/strings.h"

#include <algorithm>
#include <cassert>
#include <cctype>
#include <iostream>

NO_WARNINGS_PUSH
#include <magic_enum/magic_enum.hpp>
NO_WARNINGS_POP

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
        if (Peek() == '\n')
            ++pos;

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

static bool GetKeyword(const std::string_view token, TokenType& out)
{
    for (std::underlying_type_t<TokenType> i = Underlying(TOKEN_FIRST_KEYWORD); i <= Underlying(TOKEN_LAST_KEYWORD); ++i)
    {
        const auto type = static_cast<TokenType>(i);
        if (token == GetKeyword(type))
        {
            out = type;
            return true;
        }
    }

    out = TokenType::UNKNOWN;
    return false;
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

static bool MakeToken(Token& out, const std::string_view value, const size_t line, const size_t column)
{
    if (value.empty())
        return false;

    auto type = TokenType::UNKNOWN;
    if (!GetKeyword(value, type) && IsIdentifier(value))
        type = TokenType::IDENTIFIER;
    else if (IsIntLiteral(value))
        type = TokenType::LIT_INTEGER;
    else if (IsFloatLiteral(value))
        type = TokenType::LIT_FLOATING_POINT;
    else if (value == "+")
        type = TokenType::OP_PLUS;
    else if (value == "-")
        type = TokenType::OP_MINUS;
    else if (value == "*")
        type = TokenType::OP_STAR;
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
    else if (value == ",")
        type = TokenType::COMMA;
    else if (value == ".")
        type = TokenType::DOT;

    if (type == TokenType::UNKNOWN)
        return false;

    out = { type, value, line, column };
    return true;
}

Token::Token(const TokenType p_type, const std::string_view p_value, const size_t p_line, const size_t p_column) : type(p_type), value(p_value), line(p_line), column(p_column)
{
    assert(p_type != TokenType::UNKNOWN);
    assert(p_type == TokenType::TOKEN_EOF || !p_value.empty());
}

Token::operator bool() const
{
    return type != TokenType::UNKNOWN;
}

std::string Token::GetValueString() const
{
    std::string sanitizedValue(value.begin(), value.end());
    ReplaceAll(sanitizedValue, "\r\n", "\\n");
    ReplaceAll(sanitizedValue, "\r", "\\n");
    ReplaceAll(sanitizedValue, "\n", "\\n");
    ReplaceAll(sanitizedValue, "\t", "\\t");
    return sanitizedValue;
}

std::ostream& Token::Print(std::ostream& os) const
{
    return os << '(' << line << ':' << column << ") " << magic_enum::enum_name(type) << (value.empty() ? "" : "(" + GetValueString() + ")");
}

static void PushTerminator(std::vector<Token>& tokensOut, const Cursor& cursor)
{
    if (tokensOut.empty() || tokensOut.back().type == TokenType::TERMINATOR)
        return;

    const std::string_view terminatorStr = cursor.Peek() == '\r' ? "\n" : cursor.source.substr(cursor.pos, 1);
    tokensOut.emplace_back(TokenType::TERMINATOR, terminatorStr, cursor.line, cursor.column);
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
                std::cout << '(' << tokenStart.line << ':' << tokenStart.column << ") Warning: Unterminated string literal" << std::endl;
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
                std::cout << '(' << tokenStart.line << ':' << tokenStart.column << ") Warning: Unterminated rune literal" << std::endl;
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
                    std::cout << '(' << tokenStart.line << ':' << tokenStart.column << ") Warning: Unterminated block comment" << std::endl;
                }

                continue;
            }

            break;
        case '\\':
            if (!cursor.ConsumeIf('\r') && !cursor.ConsumeIf('\n'))
            {
                // TODO: Properly log error
                std::cerr << '(' << cursor.line << ':' << cursor.column << ") Error: Invalid escape sequence. Expected '\\n', Received '" << cursor.Peek() << '\'' << std::endl;
                return false;
            }
            continue;
        case '\n':
        case ';':
            PushTerminator(tokensOut, tokenStart);
            continue;
        default:
            break;
        }

        if (std::isspace(tokenStart.Peek()))
            continue;

        const std::string_view tokenStr = source.substr(tokenStart.pos, cursor.pos - tokenStart.pos);

        Token token;
        if (!MakeToken(token, tokenStr, tokenStart.line, tokenStart.column))
        {
            // TODO: Properly log warning
            std::cout << '(' << tokenStart.line << ':' << tokenStart.column << ") Warning: Unknown token '" << tokenStr << '\'' << std::endl;
            continue;
        }

        while (cursor.Peek() != '\0')
        {
            // Special case for integer literals followed by the range operator
            // This prevents the lexer from treating "1..2" as the floats "1." and ".2"
            if (token.type == TokenType::LIT_INTEGER && cursor.Peek() == '.' && cursor.Peek(1) == '.')
                break;

            const std::string_view nextTokenStr = source.substr(tokenStart.pos, cursor.pos + 1 - tokenStart.pos);
            if (!MakeToken(token, nextTokenStr, tokenStart.line, tokenStart.column))
                break;

            cursor.Consume();
        }

        tokensOut.push_back(token);
    }

    tokensOut.emplace_back(TokenType::TOKEN_EOF, "", cursor.line, cursor.column);
    return true;
}
