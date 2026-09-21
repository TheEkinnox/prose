#pragma once
#include "lexer/lexer.h"
#include "parser/fwd.h"

#include "utility/macros.h"

#include "external/better_enums/enum.h"

#include <memory>
#include <vector>

CLANG_IGNORE_WARNING_PUSH("-Wglobal-constructors")
BETTER_ENUM(PostfixType, uint8_t,
    Call,
    Index,
    Slice,
    MemberAccess,
    Increment,
    Decrement
)
CLANG_IGNORE_WARNING_POP

struct Postfix
{
    PostfixType type;

    explicit Postfix(PostfixType p_type);
    Postfix(const Postfix&) = default;
    Postfix& operator=(const Postfix&) = default;
    virtual ~Postfix() = default;

    virtual std::ostream& Print(std::ostream& os, ParserDepthT depth) const;
};

struct Call : Postfix
{
    std::vector<std::unique_ptr<Expression>> arguments;

    Call();

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct Index : Postfix
{
    std::unique_ptr<Expression> index;

    explicit Index(std::unique_ptr<Expression>&& p_index);

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct Slice : Postfix
{
    std::unique_ptr<Expression> start, end;

    explicit Slice(std::unique_ptr<Expression>&& p_start, std::unique_ptr<Expression>&& p_end);

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct MemberAccess : Postfix
{
    Token member;

    explicit MemberAccess(Token p_member);

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

bool ParsePostfix(TokenStream& stream, std::unique_ptr<Postfix>& out);
bool ParseCallPostfix(TokenStream& stream, std::unique_ptr<Postfix>& out);
