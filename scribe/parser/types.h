#pragma once
#include "lexer/lexer.h"

#include "parser/fwd.h"

#include <cstdint>
#include <memory>
#include <vector>

enum class ModifierType : uint8_t
{
    Pointer,
    Reference,
    FixedArray,
    DynamicArray,
    Slice
};

struct TypeModifier
{
    ModifierType type;

    explicit TypeModifier(ModifierType p_type);
    TypeModifier(const TypeModifier&) = default;
    TypeModifier& operator=(const TypeModifier&) = default;
    virtual ~TypeModifier() = default;

    virtual std::ostream& Print(std::ostream& os, ParserDepthT depth) const;
};

struct FixedArrayModifier : TypeModifier
{
    std::unique_ptr<Expression> size;

    explicit FixedArrayModifier(std::unique_ptr<Expression>&& p_size);

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct Type
{
    Token base;
    std::vector<std::unique_ptr<TypeModifier>> modifiers;

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const;
};

bool ParseType(TokenStream& stream, Type& out);
bool IsArrayModifier(ModifierType type);
