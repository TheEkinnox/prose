#include "file.h"

#include <filesystem>
#include <fstream>
#include <iostream>

bool ReadFile(const std::filesystem::path& sourcePath, std::string& out)
{
    const std::ifstream fs(sourcePath, std::ios::in | std::ios::binary);
    if (!fs.is_open())
    {
        // TODO: Properly handle file open error
        std::cerr << "Failed to open file '" << sourcePath << "'" << std::endl;
        return false;
    }

    std::ostringstream stringStream;
    stringStream << fs.rdbuf();

    if (fs.bad())
    {
        // TODO: Properly handle file read error
        std::cerr << "Failed to read file '" << sourcePath << "'" << std::endl;
        return false;
    }

    out = std::move(stringStream).str();
    return true;
}
