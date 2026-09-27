#pragma once
#include <charconv>
#include <ostream>
#include <string>

void ReplaceAll(std::string& source, const std::string& from, const std::string& to);
std::string_view& TrimStart(std::string_view& view);
std::string_view& TrimEnd(std::string_view& view);
std::string_view& Trim(std::string_view& view);

template <typename T>
std::from_chars_result from_chars(const std::string_view source, T& out, const int base = 10)
{
    return std::from_chars(source.data(), source.data() + source.size(), out, base);
}

template <typename T>
concept Printable = requires(std::ostream& os, T const& t)
{
    t.Print(os);
};

template <Printable T>
std::ostream& operator<<(std::ostream& os, const T& t)
{
    t.Print(os);
    return os;
}

template <typename DepthT, typename T>
std::ostream& PrintAtDepth(std::ostream& os, const DepthT depth, T&& arg)
{
    for (DepthT i = 0; i < depth; ++i)
        os << "|  ";

    return os << arg;
}
