#pragma once
#include "lexer/lexer.h"

#include "parser/expressions.h"
#include "parser/statements.h"
#include "parser/types.h"

#include <memory>
#include <optional>
#include <vector>

struct Declaration : Statement
{
    Token name;
};

struct VariableDeclaration : Declaration
{
    std::optional<Type> type;
    std::unique_ptr<Expression> initializer;
    bool isConst;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct FunctionDeclaration : Declaration
{
    std::optional<Type> type;
    std::vector<VariableDeclaration> parameters;
    Block body;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct TypeDeclaration : Declaration
{
    std::vector<VariableDeclaration> members;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct EnumElement
{
    Token name;
    std::unique_ptr<Expression> initializer;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const;
};

struct EnumDeclaration : Declaration
{
    std::optional<Type> type;
    std::vector<EnumElement> elements;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

ParseResult ParseDeclaration(TokenStream& stream, std::unique_ptr<Declaration>& out);
bool RequireDeclaration(TokenStream& stream, std::unique_ptr<Declaration>& out);
