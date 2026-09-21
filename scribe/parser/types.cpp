#include "types.h"

#include "parser/expressions.h"
#include "parser/parser.h"
#include "parser/postfix.h"
#include "parser/token_stream.h"

#include "utility/strings.h"

TypeModifier::TypeModifier(const ModifierType p_type) : type(p_type)
{
}

std::ostream& TypeModifier::Print(std::ostream& os, const ParserDepthT depth) const
{
    return PrintAtDepth(os, depth, type._to_string());
}

FixedArrayModifier::FixedArrayModifier(std::unique_ptr<Expression>&& p_size) : TypeModifier(ModifierType::FixedArray), size(std::move(p_size))
{
}

std::ostream& FixedArrayModifier::Print(std::ostream& os, ParserDepthT depth) const
{
    TypeModifier::Print(os, depth++) << '\n';
    return size->Print(os, depth);
}

std::ostream& Type::Print(std::ostream& os, const ParserDepthT depth) const
{
    PrintAtDepth(os, depth, "Base: ") << base.value << '\n';

    PrintAtDepth(os, depth, "Modifiers: ");
    if (modifiers.empty())
    {
        os << "None";
    }
    else
    {
        for (const auto& modifier : modifiers)
            modifier->Print(os << '\n', depth + 1);
    }

    return os;
}

static bool ParseModifier(TokenStream& stream, std::unique_ptr<TypeModifier>& out)
{
    out = nullptr;

    Token token;
    if (stream.ConsumeIf(TokenType::OP_MUL, token))
    {
        out = std::make_unique<TypeModifier>(ModifierType::Pointer);
    }
    else if (stream.ConsumeIf(TokenType::OP_BITWISE_AND, token))
    {
        out = std::make_unique<TypeModifier>(ModifierType::Reference);
    }
    else if (stream.Is(TokenType::LBRACKET))
    {
        stream.Consume();

        token = stream.Peek();
        if (token.type == TokenType::RBRACKET)
        {
            stream.Consume();
            out = std::make_unique<TypeModifier>(ModifierType::DynamicArray);
        }
        else if (token.type == TokenType::COLON)
        {
            stream.Consume();

            if (!stream.Expect(TokenType::RBRACKET, token))
                return false;

            out = std::make_unique<TypeModifier>(ModifierType::Slice);
        }
        else
        {
            std::unique_ptr<Expression> arrSize;

            if (!ParseExpression(stream, arrSize) || !stream.Expect(TokenType::RBRACKET, token))
                return false;

            out = std::make_unique<FixedArrayModifier>(std::move(arrSize));
        }
    }

    return out != nullptr;
}

bool ParseType(TokenStream& stream, Type& out)
{
    Type type;
    Token token = stream.Peek();

    if (!IsBuiltInType(token.type) && token.type != TokenType::IDENTIFIER)
    {
        LogError(token, "Expected built-in type or identifier");
        return false;
    }

    type.base = stream.Consume();

    std::unique_ptr<TypeModifier> modifier;
    while (ParseModifier(stream, modifier))
        type.modifiers.emplace_back(std::move(modifier));

    if (type.base.type != TokenType::UNKNOWN)
        out = std::move(type);

    return true;
}

bool IsArrayModifier(const ModifierType type)
{
    return type == ModifierType::DynamicArray || type == ModifierType::FixedArray;
}
