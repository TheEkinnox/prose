#include "file.h"

#include <fstream>
#include <sstream>

bool ReadFile(const std::string& sourcePath, std::string& out)
{
    const std::ifstream fs(sourcePath, std::ios::in | std::ios::binary);
    if (!fs.is_open())
    {
        // TODO: Properly handle file open error
        fprintf(stderr, "Failed to open file '%s'\n", sourcePath.c_str());
        fflush(stderr);
        return false;
    }

    std::ostringstream stringStream;
    stringStream << fs.rdbuf();

    if (fs.bad())
    {
        // TODO: Properly handle file read error
        fprintf(stderr, "Failed to read file '%s'\n", sourcePath.c_str());
        fflush(stderr);
        return false;
    }

    out = std::move(stringStream).str();
    return true;
}
