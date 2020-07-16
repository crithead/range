cmake_minimum_required(VERSION 3.0)
project(Range
    VERSION 1.0.0
    LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

add_executable(range
    src/range.cpp
)

install(TARGETS range DESTINATION bin)
