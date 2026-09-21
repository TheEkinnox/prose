#pragma once
#include "lexer/lexer.h"

#include "parser/statements.h"
#include "parser/types.h"

#include <memory>
#include <optional>

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

bool ParseDeclaration(TokenStream& stream, std::unique_ptr<Declaration>& out);
