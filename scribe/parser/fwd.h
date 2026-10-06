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

enum class StatementType : uint8_t
{
    INTERNAL,

    IfStatement,
    WhileStatement,
    RepeatStatement,
    ForStatement,
    SwitchStatement,
    ReturnStatement,
    BreakStatement,
    ContinueStatement,
    DeferStatement,
    ScopeStatement,

    VariableDeclaration,
    FunctionDeclaration,
    TypeDeclaration,
    EnumDeclaration,
    AliasDeclaration,

    LiteralExpression,
    ArrayLiteralExpression,
    IdentifierExpression,
    ConstructionExpression,
    UnaryExpression,
    BinaryExpression,
    MakeExpression,
    SizeOfExpression
};
