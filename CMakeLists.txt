cmake_minimum_required(VERSION 3.0)
project(Range
    VERSION 1.0.0
    LANGUAGES CXX
)

# Build the tool
set(GCC_CXX_FLAGS "-Wall -Wextra -Wpedantic -O2")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${GCC_CXX_FLAGS}")

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

add_executable(range
    src/range.cpp
)

install(TARGETS range DESTINATION bin)

# Build the man page

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}")
include(${PROJECT_SOURCE_DIR}/FindPANDOC.cmake)
find_package(PANDOC)

if (PANDOC_FOUND)
    message(STATUS "Found pandoc")
    set(MAN_PAGE_SRC ${CMAKE_CURRENT_BINARY_DIR}/../range.md)
    add_custom_target(manual
        COMMAND ${PANDOC_EXECUTABLE} --standalone --to man ${MAN_PAGE_SRC} -o range.1
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
        COMMENT "Generating online manual page"
        VERBATIM)
else (PANDOC_FOUND)
    message("Install pandoc to generate the manual")
endif (PANDOC_FOUND)


# Build the Debian Package
include(${PROJECT_SOURCE_DIR}/FindFPM.cmake)
find_package(FPM)

if (FPM_FOUND)
    message(STATUS "Found fpm")
    add_custom_target(package
        COMMAND ${FPM_EXECUTABLE} --input-type dir --output-type deb --name range --version "${PROJECT_VERSION}" --license "CC0" --url "https://github.com/crithead/range" --prefix "/usr/local/bin" range
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
        DEPENDS range manual
        COMMENT "Generating Debian package"
        VERBATIM)
else (FPM_FOUND)
    message("Install fpm to generate the package")
endif (FPM_FOUND)

