cmake_minimum_required(VERSION 3.0)
project(Range
    VERSION 1.0.0
    LANGUAGES CXX
)

set(GCC_CXX_FLAGS "-Wall -Wextra -Wpedantic -O2")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${GCC_CXX_FLAGS}")

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

add_executable(range
    src/range.cpp
)

install(TARGETS range DESTINATION bin)
install(FILES range.1 DESTINATION man/man1)

