# set target
get_filename_component(CURRENT_FOLDER_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)
set(TARGET_NAME ${CURRENT_FOLDER_NAME})

# Set compile options
if (MSVC AND NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    add_compile_options(/W4 /WX /Zc:preprocessor /Zc:u8EscapeEncoding)
else()
    set(IGNORED_WARNINGS
            -Wno-unused-macros
            -Wno-reserved-macro-identifier
            -Wno-c++98-compat -Wno-c++98-compat-pedantic
            -Wno-switch-enum
            -Wno-gnu-zero-variadic-macro-arguments
            -Wno-unsafe-buffer-usage
            -Wno-unknown-pragmas
    )

    add_compile_options(-Wall -Wextra -Wpedantic -Werror ${IGNORED_WARNINGS})
endif()

# Add source files
set(TARGET_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})
file(GLOB_RECURSE SOURCE_FILES
    ${TARGET_SOURCE_DIR}/*.c
    ${TARGET_SOURCE_DIR}/*.cpp
)

# Add header files
set(TARGET_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR})
file(GLOB_RECURSE HEADER_FILES
    ${TARGET_INCLUDE_DIR}/*.h
    ${TARGET_INCLUDE_DIR}/*.hpp
    ${TARGET_INCLUDE_DIR}/*.inl
)

source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${HEADER_FILES} ${SOURCE_FILES})

# Setup executable
add_executable(${TARGET_NAME} ${HEADER_FILES} ${SOURCE_FILES})
target_include_directories(${TARGET_NAME} PRIVATE ${TARGET_INCLUDE_DIR})
target_link_libraries(${TARGET_NAME} PRIVATE magic_enum::magic_enum)

if (CMAKE_GENERATOR MATCHES "Visual Studio")
    set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ${TARGET_NAME})
endif()

if (${BUILD_TESTING})
    # Setup executable
    set(TEST_TARGET_NAME ${TARGET_NAME}Test)
    add_executable(${TEST_TARGET_NAME} ${HEADER_FILES} ${SOURCE_FILES})
    target_include_directories(${TEST_TARGET_NAME} PRIVATE ${TARGET_INCLUDE_DIR})
    target_link_libraries(${TEST_TARGET_NAME} PRIVATE magic_enum::magic_enum GTest::gtest_main)
    target_compile_definitions(${TEST_TARGET_NAME} PRIVATE BUILD_TESTING)

    add_custom_command(TARGET ${TARGET_NAME} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E create_symlink ${TESTS_DIR} $<TARGET_FILE_DIR:${TEST_TARGET_NAME}>/tests
    )

    include(GoogleTest)
    gtest_discover_tests(${TEST_TARGET_NAME})
endif()