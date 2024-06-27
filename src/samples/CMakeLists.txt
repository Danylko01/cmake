#xcpp/src/samples/CMakeLists.txt
cmake_minimum_required(VERSION 3.22)
project(samples)

#获取当前目录下的所有子目录
file(GLOB dirs LIST_DIRECTORIES true ${CMAKE_CURRENT_LIST_DIR}/*)
#存储所有样例
set(samps)

foreach(dir IN LISTS dirs)
    if (EXISTS ${dir}/CMakeLists.txt)
        message("dir = ${dir}")
        list(APPEND samps ${dir})
    endif()
endforeach()

foreach(smap IN LISTS samps)
    add_subdirectory(${smap})
endforeach()