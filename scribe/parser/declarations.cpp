#include "declarations.h"

#include "parser/parser.h"
#include "parser/expressions.h"
#include "parser/token_stream.h"
#include "parser/types.h"

#include "utility/strings.h"

std::ostream& VariableDeclaration::Print(std::ostream& os, ParserDepthT depth) const
{
    PrintAtDepth(os, depth++, "VariableDeclaration") << '\n';

    PrintAtDepth(os, depth, "IsConst: ") << (isConst ? "true" : "false") << '\n';

    PrintAtDepth(os, depth, "Name: '") << name.value << "'\n";

    PrintAtDepth(os, depth, "Type:");
    if (type.has_value())
        type.value().Print(os << '\n', depth + 1);
    else
        os << " None";

    PrintAtDepth(os << '\n', depth, "Initializer:");
    if (initializer)
        initializer->Print(os << '\n', depth + 1);
    else
        os << " None";

    return os;
}

std::ostream& FunctionDeclaration::Print(std::ostream& os, ParserDepthT depth) const
{
    PrintAtDepth(os, depth++, "FunctionDeclaration") << '\n';
    PrintAtDepth(os, depth, "Name: '") << name.value << "'\n";

    PrintAtDepth(os, depth, "Type:");
    if (type.has_value())
        type.value().Print(os << '\n', depth + 1);
    else
        os << " None";

    PrintAtDepth(os << '\n', depth, "Parameters:");
    if (!parameters.empty())
    {
        for (const auto& parameter : parameters)
            parameter.Print(os << '\n', depth + 1);
    }
    else
    {
        os << " None";
    }

    PrintAtDepth(os << '\n', depth, "Body:") << '\n';
    return body.Print(os, depth + 1);
}

std::ostream& TypeDeclaration::Print(std::ostream& os, ParserDepthT depth) const
{
    PrintAtDepth(os, depth++, "TypeDeclaration") << '\n';
    PrintAtDepth(os, depth, "Name: '") << name.value << "'\n";
    PrintAtDepth(os, depth, "Members:");
    if (!members.empty())
    {
        for (const auto& member : members)
            member.Print(os << '\n', depth + 1);
    }
    else
    {
        os << " None";
    }

    return os;
}

std::ostream& EnumElement::Print(std::ostream& os, const ParserDepthT depth) const
{
    PrintAtDepth(os, depth, "Name: ") << name.value << '\n';
    PrintAtDepth(os, depth, "Initializer:");
    if (initializer)
        return initializer->Print(os << '\n', depth + 1);

    return os << " None";
}

std::ostream& EnumDeclaration::Print(std::ostream& os, ParserDepthT depth) const
{
    PrintAtDepth(os, depth++, "EnumDeclaration") << '\n';
    PrintAtDepth(os, depth, "Name: ") << name.value << '\n';
    PrintAtDepth(os, depth, "Type:");
    if (type)
        type->Print(os << '\n', depth + 1);
    else
        os << " None";

    for (size_t i = 0; i < elements.size(); ++i)
    {
        PrintAtDepth(os << '\n', depth, "Element ") << i << '\n';
        elements[i].Print(os, depth + 1);
    }

    return os;
}

std::ostream& AliasDeclaration::Print(std::ostream& os, ParserDepthT depth) const
{
    PrintAtDepth(os, depth++, "AliasDeclaration") << '\n';
    PrintAtDepth(os, depth, "Name: ") << name.value << '\n';
    PrintAtDepth(os, depth, "Type:\n");
    return type.Print(os, depth + 1);
}

static ParseResult ParseVariableDeclaration(TokenStream& stream, std::unique_ptr<Declaration>& out)
{
    VariableDeclaration variable{};

    Token token;
    if (stream.ConsumeIf(TokenType::KW_CONST, token))
    {
        variable.isConst = true;
    }

    if (!variable.isConst && stream.Is(TokenType::IDENTIFIER))
    {
        // Check ahead and potentially early out to handle ambiguity
        // with other statements that start with an identifier
        const Token next = stream.PeekNext();
        if (next.type != TokenType::OP_ASSIGN && next.type != TokenType::COLON)
            return ParseResult::None;
    }

    if (!stream.Expect(TokenType::IDENTIFIER, token))
        return ParseResult::Failure;

    variable.name = token;

    if (stream.ConsumeIf(TokenType::COLON, token))
    {
        Type type;

        if (!ParseType(stream, type))
            return ParseResult::Failure;

        variable.type = std::move(type);
    }
    else
    {
        variable.type = std::nullopt;
    }

    if (!variable.type.has_value())
    {
        if (!stream.Expect(TokenType::OP_ASSIGN, token) || !RequireExpression(stream, variable.initializer) )
            return ParseResult::Failure;
    }
    else if (stream.ConsumeIf(TokenType::OP_ASSIGN, token) && !RequireExpression(stream, variable.initializer) )
    {
        return ParseResult::Failure;
    }

    out = std::make_unique<VariableDeclaration>(std::move(variable));
    return ParseResult::Success;
}

static bool RequireVariableDeclaration(TokenStream& stream, std::unique_ptr<Declaration>& out)
{
    const ParseResult result = ParseVariableDeclaration(stream, out);
    if (result == ParseResult::Success)
        return true;

    if (result == ParseResult::None)
        LogError(stream.Peek(), "Expected variable declaration");

    return false;
}

static bool ParseFunctionDeclaration(TokenStream& stream, std::unique_ptr<Declaration>& out)
{
    out = nullptr;

    Token token;
    if (!stream.Expect(TokenType::KW_FN, token))
        return false;

    const Token fnToken = token;
    FunctionDeclaration function{};
    if (!stream.Expect(TokenType::IDENTIFIER, function.name))
        return false;

    if (stream.ConsumeIf(TokenType::LPAREN, token))
    {
        bool isFirst = true;
        bool hasDefault = false;
        while (!stream.Is(TokenType::RPAREN))
        {
            if (!isFirst) // Prevents silently accepting parameter lists starting with a comma
                stream.ConsumeIf(TokenType::COMMA, token);

            std::unique_ptr<Declaration> parameter;
            if (!RequireVariableDeclaration(stream, parameter))
                return false;

            auto& parameterDecl = dynamic_cast<VariableDeclaration&>(*parameter);
            if (parameterDecl.initializer)
            {
                hasDefault = true;
            }
            else if (hasDefault)
            {
                LogError(parameterDecl.name, "Defaulted parameters must be last");
                return false;
            }

            function.parameters.emplace_back(std::move(parameterDecl));
            isFirst = false;
        }

        if (!stream.Expect(TokenType::RPAREN, token))
            return false;
    }

    if (stream.ConsumeIf(TokenType::COLON, token))
    {
        Type returnType;
        if (!ParseType(stream, returnType))
            return false;

        function.type = std::move(returnType);
    }
    else
    {
        function.type = std::nullopt;
    }

    if (!stream.Expect(IsTerminator, token, "Expected terminator"))
        return false;

    if (token.type != TokenType::KW_END)
    {
        if (!ParseBlock(stream, function.body, fnToken))
            return false;
    }

    out = std::make_unique<FunctionDeclaration>(std::move(function));
    return true;
}

static bool ParseTypeDeclaration(TokenStream& stream, std::unique_ptr<Declaration>& out)
{
    out = nullptr;

    Token token;
    if (!stream.Expect(TokenType::KW_TYPE, token))
        return false;

    TypeDeclaration type{};
    if (!stream.Expect(TokenType::IDENTIFIER, type.name) || !stream.Expect(IsTerminator, token, "Expected terminator"))
        return false;

    if (token.type == TokenType::TOKEN_EOF)
    {
        LogError(token, "Expected type member or end");
        return false;
    }

    while (token.type != TokenType::KW_END && !stream.ConsumeIf(TokenType::KW_END, token))
    {
        std::unique_ptr<Declaration> member;
        if (!RequireVariableDeclaration(stream, member))
            return false;

        stream.ConsumeIf(IsTerminator, token);
        type.members.emplace_back(std::move(dynamic_cast<VariableDeclaration&>(*member)));
    }

    out = std::make_unique<TypeDeclaration>(std::move(type));
    return true;
}

static bool ParseEnumDeclaration(TokenStream& stream, std::unique_ptr<Declaration>& out)
{
    out = nullptr;

    Token token;
    if (!stream.Expect(TokenType::KW_ENUM, token))
        return false;

    EnumDeclaration declaration{};
    if (!stream.Expect(TokenType::IDENTIFIER, declaration.name))
        return false;

    if (stream.ConsumeIf(TokenType::COLON, token))
    {
        Type type{};
        if (!ParseType(stream, type))
            return false;

        declaration.type = std::move(type);
    }

    if (!stream.Expect(TokenType::TERMINATOR, token))
        return false;

    while (!stream.ConsumeIf(TokenType::KW_END, token))
    {
        EnumElement element;
        if (!stream.Expect(TokenType::IDENTIFIER, element.name))
            return false;

        if (stream.ConsumeIf(TokenType::OP_ASSIGN, token))
        {
            if (!RequireExpression(stream, element.initializer))
                return false;
        }
        else if (!IsTerminator(stream.Peek().type))
        {
            LogError(stream.Peek(), "Expected assignment or terminator");
            return false;
        }

        if (!stream.Expect(TokenType::TERMINATOR, token))
            return false;

        declaration.elements.emplace_back(std::move(element));
    }

    if (declaration.elements.empty())
    {
        LogError(token, "Enum declaration must not be empty");
        return false;
    }

    out = std::make_unique<EnumDeclaration>(std::move(declaration));
    return true;
}

static bool ParseAliasDeclaration(TokenStream& stream, std::unique_ptr<Declaration>& out)
{
    out = nullptr;

    Token token;
    if (!stream.Expect(TokenType::KW_ALIAS, token))
        return false;

    AliasDeclaration alias{};
    if (!stream.Expect(TokenType::IDENTIFIER, alias.name))
        return false;

    if (!stream.Expect(TokenType::OP_ASSIGN, token))
        return false;

    if (!ParseType(stream, alias.type))
        return false;

    out = std::make_unique<AliasDeclaration>(std::move(alias));
    return true;
}

ParseResult ParseDeclaration(TokenStream& stream, std::unique_ptr<Declaration>& out)
{
    switch (stream.Peek().type)
    {
    case TokenType::KW_CONST:
    case TokenType::IDENTIFIER:
        return ParseVariableDeclaration(stream, out);
    case TokenType::KW_FN:
        return ParseFunctionDeclaration(stream, out) ? ParseResult::Success : ParseResult::Failure;
    case TokenType::KW_TYPE:
        return ParseTypeDeclaration(stream, out) ? ParseResult::Success : ParseResult::Failure;
    case TokenType::KW_ENUM:
        return ParseEnumDeclaration(stream, out) ? ParseResult::Success : ParseResult::Failure;
    case TokenType::KW_ALIAS:
        return ParseAliasDeclaration(stream, out) ? ParseResult::Success : ParseResult::Failure;
    default:
        return ParseResult::None;
    }
}

bool RequireDeclaration(TokenStream& stream, std::unique_ptr<Declaration>& out)
{
    const ParseResult result = ParseDeclaration(stream, out);

    if (result == ParseResult::Success)
        return true;

    if (result == ParseResult::None)
        LogError(stream.Peek(), "Expected declaration");

    return false;
}
