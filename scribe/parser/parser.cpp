#include "parser.h"

#include "parser/declarations.h"
#include "parser/token_stream.h"

#include "utility/strings.h"

#include <iostream>

void LogError(const Token& token, const std::string_view message)
{
    // TODO: Properly handle parser errors
    std::cerr << '(' << token.line << ':' << token.column << ") Unexpected ";

    switch (token.type)
    {
    case TokenType::TOKEN_EOF:
        std::cerr << "end of file";
        break;
    case TokenType::TERMINATOR:
        std::cerr << "terminator '" << token.GetValueString() << '\'';
        break;
    default:
        std::cerr << "token '" << token.value << '\'';
        break;
    }

    if (!message.empty())
        std::cerr << ". " << message;

    std::cerr << '.' << std::endl;
}

std::ostream& Program::Print(std::ostream& os) const
{
    os << "Program";

    if (declarations.empty())
        return PrintAtDepth(os << '\n', 1, "No declarations");

    for (const auto& declaration : declarations)
        declaration->Print(os << '\n', 1);

    return os;
}

bool ParseProgram(const std::vector<Token>& tokens, Program& out)
{
    out.declarations.clear();
    TokenStream stream{ tokens };

    while (!stream.Is(TokenType::TOKEN_EOF))
    {
        Token token;
        if (stream.ConsumeIf(TokenType::TERMINATOR, token))
            continue;

        std::unique_ptr<Declaration> declaration;
        if (!RequireDeclaration(stream, declaration))
            return false;

        out.declarations.emplace_back(std::move(declaration));
    }

    return true;
}
