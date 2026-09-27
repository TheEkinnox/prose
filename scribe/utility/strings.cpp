#include "strings.h"

void ReplaceAll(std::string& source, const std::string& from, const std::string& to)
{
    if (from.empty())
        return;

    size_t pos = 0;
    while ((pos = source.find(from, pos)) != std::string::npos)
    {
        source.replace(pos, from.length(), to);
        pos += to.length();
    }
}

std::string_view& TrimStart(std::string_view& view)
{
    size_t pos = 0;
    while (pos < view.size() && std::isspace(view[pos]))
        ++pos;

    return view = view.substr(pos);
}

std::string_view& TrimEnd(std::string_view& view)
{
    size_t count = 0;
    while (count < view.size() && std::isspace(view[view.size() - 1 - count]))
    {
        ++count;
    }

    return view = view.substr(0, view.size() - count);
}

std::string_view& Trim(std::string_view& view)
{
    return TrimEnd(TrimStart(view));
}
