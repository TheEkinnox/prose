#include "lexer.h"

#include <algorithm>
#include <cassert>
#include <cctype>

constexpr std::string_view KEYWORDS[] = {
    "sizeof",
    "fn", "scope", "defer", "make", "return", "end",
    "if", "else",
    "switch", "case", "fallthrough", "default",
    "for", "in", "break", "continue",
    "while", "repeat", "until",
    "const", "type", "enum", "alias", "move"
};

constexpr std::string_view BUILT_IN_TYPES[] = {
    "i8", "i16", "i32", "i64", "iptr",
    "u8", "u16", "u32", "u64", "uptr", "byte",
    "f32", "f64",
    "bool", "rune", "string", "void"
};

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

static bool IsIdentifier(const std::string_view token)
{
    if (token.empty())
        return false;

    if (!std::isalpha(token[0]))
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

    if (value == "null")
        type = TokenType::KW_NULL;
    else if (value == "true")
        type = TokenType::KW_TRUE;
    else if (value == "false")
        type = TokenType::KW_FALSE;
    else if (std::ranges::find(BUILT_IN_TYPES, value) != std::end(BUILT_IN_TYPES))
        type = TokenType::BUILT_IN_TYPE;
    else if (std::ranges::find(KEYWORDS, value) != std::end(KEYWORDS))
        type = TokenType::KEYWORD;
    else if (IsIdentifier(value))
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
            break;
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
            break;
        }
        case '/':
            if (cursor.ConsumeIf('/'))
            {
                while (cursor.Peek() != '\r' && cursor.Peek() != '\n' && cursor.Peek() != '\0')
                {
                    cursor.Consume();
                }
            }
            else if (cursor.ConsumeIf('*'))
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
            }

            if (tokenStart.pos != cursor.pos - 1)
            {
                const std::string_view tokenStr = source.substr(tokenStart.pos, cursor.pos - tokenStart.pos);
                tokensOut.emplace_back(TokenType::COMMENT, tokenStr, tokenStart.line, tokenStart.column);
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
            break;
        case '\n':
            tokensOut.emplace_back(TokenType::NEWLINE, "\n", tokenStart.line, tokenStart.column);
            break;
        default:
        {
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
            break;
        }
        }
    }

    tokensOut.emplace_back(TokenType::TOKEN_EOF, "", cursor.line, cursor.column);
    return true;
}
