#include "file.h"

#include <cassert>
#include <filesystem>
#include <fstream>
#include <iostream>

#ifdef BUILD_TESTING
std::vector<std::filesystem::path> GetTestFiles(const std::filesystem::path& testsRoot)
{
    std::vector<std::filesystem::path> testFiles;

    assert(std::filesystem::exists(testsRoot));
    assert(std::filesystem::is_directory(testsRoot));

    const ptrdiff_t fileCount = std::distance(std::filesystem::directory_iterator(testsRoot), std::filesystem::directory_iterator());
    testFiles.reserve(static_cast<size_t>(fileCount));

    for (const auto& file : std::filesystem::directory_iterator(testsRoot))
    {
        if (file.is_directory())
            continue;

        const std::filesystem::path& filePath = file.path();
        if (filePath.extension() != ".prose")
            continue;

        testFiles.emplace_back(filePath);
    }

    return testFiles;
}
#endif

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
