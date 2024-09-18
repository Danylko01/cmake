#xcpp/src/xthread_pool/CMakeLists.txt
# xthread_pool库编译
cmake_minimum_required(VERSION 3.22)

project(xthread_pool)

include(${CMAKE_CURRENT_LIST_DIR}/../../cmake/common.cmake)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
cpp_library(${PROJECT_NAME})
