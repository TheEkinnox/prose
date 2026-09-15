#include "strings.h"

void ReplaceAll(std::string& source, const std::string& from, const std::string& to)
{
    if(from.empty())
        return;

    size_t pos = 0;
    while ((pos = source.find(from, pos)) != std::string::npos)
    {
        source.replace(pos, from.length(), to);
        pos += to.length();
    }
}