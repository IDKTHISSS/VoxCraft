cmake_minimum_required(VERSION 3.16)
project(VoxCraft)

set(CMAKE_CXX_STANDARD 17)

add_subdirectory(Engine)

add_executable(VoxCraft EntryPoint.cpp)
target_link_libraries(VoxCraft VoxCore)
