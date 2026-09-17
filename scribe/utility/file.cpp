#include "file.h"

#include <fstream>
#include <sstream>

std::string ReadFile(const std::string& sourcePath)
{
    const std::ifstream fs(sourcePath, std::ios::in | std::ios::binary);

    if (!fs.is_open())
    {
        // TODO: Properly handle file open error
        fprintf(stderr, "Failed to open file '%s'\n", sourcePath.c_str());
        fflush(stderr);
        return {};
    }

    std::ostringstream stringStream;
    stringStream << fs.rdbuf();

    if (fs.bad())
    {
        // TODO: Properly handle file read error
        fprintf(stderr, "Failed to read file '%s'\n", sourcePath.c_str());
        fflush(stderr);
        return {};
    }

    return stringStream.str();
}
