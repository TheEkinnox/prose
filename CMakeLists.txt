cmake_minimum_required(VERSION 3.20 FATAL_ERROR)

set(USE_FOLDERS ON)
project(Prose LANGUAGES CXX C)

set(BASE_FOLDER ${CMAKE_FOLDER})

# Setup cpp version
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)

# Setup debug defines
if (MSVC)
    set(CMAKE_C_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /DDEBUG /D_DEBUG")
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /DDEBUG /D_DEBUG")
else()
    set(CMAKE_C_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -DDEBUG -D_DEBUG")
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -DDEBUG -D_DEBUG")
endif()

################
# Dependencies #
################
set(CMAKE_FOLDER deps)
add_subdirectory(deps)
set(CMAKE_FOLDER ${BASE_FOLDER})

#########
# Tests #
#########
option(BUILD_TESTING "" OFF)
if (${BUILD_TESTING})
    enable_testing()

    # set target
    set(TARGET_NAME Tests)
    set(TESTS_DIR ${CMAKE_CURRENT_SOURCE_DIR}/tests)

    file(GLOB_RECURSE TEST_FILES ${TESTS_DIR}/*)
    source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${TEST_FILES})

    add_library(${TARGET_NAME} INTERFACE ${TEST_FILES})
endif()

############
# Examples #
############

# set target
set(TARGET_NAME Examples)

file(GLOB_RECURSE EXAMPLE_FILES ${CMAKE_CURRENT_SOURCE_DIR}/examples/*)
source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${EXAMPLE_FILES})

add_library(${TARGET_NAME} INTERFACE ${EXAMPLE_FILES})

##############
# Executable #
##############

set(CMAKE_FOLDER ${BASE_FOLDER})
add_subdirectory(scribe)