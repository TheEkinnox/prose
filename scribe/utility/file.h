#pragma once
#include <filesystem>
#include <string>

bool ReadFile(const std::filesystem::path& sourcePath, std::string& out);
