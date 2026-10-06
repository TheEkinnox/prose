#pragma once
#include "lexer/lexer.h"
#include "parser/fwd.h"

#include <memory>
#include <vector>

enum class PostfixType : uint8_t
{
    Call,
    Index,
    Slice,
    MemberAccess,
    Increment,
    Decrement
};

struct Postfix
{
    PostfixType type;

    explicit Postfix(PostfixType p_type);
    Postfix(const Postfix&) = default;
    Postfix& operator=(const Postfix&) = default;
    virtual ~Postfix() = default;

    virtual std::ostream& Print(std::ostream& os, ParserDepthT depth) const;
};

struct CallPostfix : Postfix
{
    std::vector<std::unique_ptr<Expression>> arguments;

    CallPostfix();

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct IndexPostfix : Postfix
{
    std::unique_ptr<Expression> index;

    explicit IndexPostfix(std::unique_ptr<Expression>&& p_index);

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct SlicePostfix : Postfix
{
    std::unique_ptr<Expression> start, end;

    explicit SlicePostfix(std::unique_ptr<Expression>&& p_start, std::unique_ptr<Expression>&& p_end);

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

struct MemberAccessPostfix : Postfix
{
    Token member;

    explicit MemberAccessPostfix(Token p_member);

    std::ostream& Print(std::ostream& os, ParserDepthT depth) const override;
};

bool ParsePostfix(TokenStream& stream, std::unique_ptr<Postfix>& out);
bool ParseCallPostfix(TokenStream& stream, std::unique_ptr<Postfix>& out);
