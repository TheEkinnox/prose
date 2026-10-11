#pragma once
#include <filesystem>
#include <string>

#ifdef BUILD_TESTING
std::vector<std::filesystem::path> GetTestFiles(const std::filesystem::path& testsRoot);
#endif

bool ReadFile(const std::filesystem::path& sourcePath, std::string& out);
