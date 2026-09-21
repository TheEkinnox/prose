#pragma once
#include <ostream>
#include <string>

void ReplaceAll(std::string& source, const std::string& from, const std::string& to);

template<typename T>
concept Printable = requires(std::ostream& os, T const & t) {
    { t.Print(os) };
};

template<Printable T>
std::ostream& operator<<(std::ostream& os, const T& t) {
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
