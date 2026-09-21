#include "declarations.h"

#include "parser/parser.h"
#include "parser/postfix.h"
#include "parser/expressions.h"
#include "parser/token_stream.h"
#include "parser/types.h"

#include "utility/strings.h"

std::ostream& VariableDeclaration::Print(std::ostream& os, ParserDepthT depth) const
{
    PrintAtDepth(os, depth++, "VariableDeclaration") << '\n';

    PrintAtDepth(os, depth, "IsConst: ") << (isConst ? "true" : "false") << '\n';

    PrintAtDepth(os, depth, "Name: '") << name.value << "'\n";

    PrintAtDepth(os, depth, "Type: ");
    if (type.has_value())
        type.value().Print(os << '\n', depth + 1);
    else
        os << "None";
    os << '\n';

    PrintAtDepth(os, depth, "Initializer: ");
    if (initializer)
    {
        os << '\n';
        initializer->Print(os, depth + 1);
    }
    else
    {
        os << "None";
    }

    return os;
}

static bool ParseVariableDeclaration(TokenStream& stream, std::unique_ptr<Declaration>& out)
{
    VariableDeclaration variable{};

    Token token;
    if (stream.ConsumeIf(TokenType::KW_CONST, token))
    {
        variable.isConst = true;
    }

    if (!stream.Expect(TokenType::IDENTIFIER, token))
        return false;

    variable.name = token;

    if (stream.ConsumeIf(TokenType::COLON, token))
    {
        Type type;

        if (!ParseType(stream, type))
            return false;

        variable.type = std::move(type);
    }
    else
    {
        variable.type = std::nullopt;
    }

    if (!variable.type.has_value())
    {
        if (!stream.Expect(TokenType::OP_ASSIGN, token) || !ParseExpression(stream, variable.initializer))
            return false;
    }
    else if (stream.ConsumeIf(TokenType::OP_ASSIGN, token) && !ParseExpression(stream, variable.initializer))
    {
        return false;
    }

    out = std::make_unique<VariableDeclaration>(std::move(variable));
    return true;
}

bool ParseDeclaration(TokenStream& stream, std::unique_ptr<Declaration>& out)
{
    const Token& token = stream.Peek();
    switch (token.type)
    {
    case TokenType::KW_CONST:
    case TokenType::IDENTIFIER:
        return ParseVariableDeclaration(stream, out);

    default:
        LogError(token, "Expected declaration");
        return false;
    }
}
