#xlog/CMakeLists.txt
#xlog库编译
cmake_minimum_required(VERSION 3.20)
project(xlog)

#生成c++代码，传递命名空间
set(_XCPP_NAMESPACE_ "namespace xcpp {")
configure_file(xconfig.h.in ${CMAKE_CURRENT_LIST_DIR}/include/xconfig.h)

#指定xlog是动态库还是静态库
option(XLOG_SHARED "OFF is static" ON)
set(TYPE STATIC)
if (XLOG_SHARED) 
	set(TYPE SHARED)
endif()

#cpp文件
aux_source_directory(${CMAKE_CURRENT_LIST_DIR} SRC)
#h文件
FILE(GLOB H_FILE ${CMAKE_CURRENT_LIST_DIR}/*.h)
#对外接口的头文件
FILE(GLOB H_FILE_I ${CMAKE_CURRENT_LIST_DIR}/include/*.h)

#生成库
add_library(${PROJECT_NAME} ${TYPE} ${SRC} ${H_FILE} ${H_FILE_I})

#静态库和动态库传递不同的宏变量给c++
if(XLOG_SHARED)
	target_compile_definitions(${PROJECT_NAME} PUBLIC XLOG_EXPORTS)
else()
	target_compile_definitions(${PROJECT_NAME} PUBLIC XLOG_STATIC)
endif()

#设置头文件查找路径
target_include_directories(${PROJECT_NAME} PRIVATE
	${CMAKE_CURRENT_LIST_DIR}/include/
	${CMAKE_CURRENT_LIST_DIR}
)

#配置c++参数
target_compile_features(${PROJECT_NAME} PRIVATE
	cxx_std_14
)

#配置vs属性bigobj
if(MSVC)
	set_target_properties(${PROJECT_NAME} PROPERTIES
		COMPILE_FLAGS "-bigobj"
	)
endif()

#配置Debug Relase版本输出路径
#默认Debug
if(CMAKE_BUILD_TYPE STREQUAL "")
	set(CMAKE_BUILD_TYPE Debug)
endif()
set(CONF_TYPES Debug Release RelWithDebInfo MinSizeRel)
list(APPEND CONF_TYPES "")
foreach(type IN LISTS CONF_TYPES)
	set(conf "")
	if(type) 
		string(TOUPPER _${type} conf)
	endif()
	set_target_properties(${PROJECT_NAME} PROPERTIES
		RUNTIME_OUTPUT_DIRECTORY${conf} ${CMAKE_CURRENT_LIST_DIR}/../../bin  #dll exe
		LIBRARY_OUTPUT_DIRECTORY${conf} ${CMAKE_CURRENT_LIST_DIR}/../../lib  #so dylib
		ARCHIVE_OUTPUT_DIRECTORY${conf} ${CMAKE_CURRENT_LIST_DIR}/../../lib  #lib a
		PDB_OUTPUT_DIRECTORY${conf} ${CMAKE_CURRENT_LIST_DIR}/../../bin      #pdb
	)
endforeach()

#Debug添加后缀
set_target_properties(${PROJECT_NAME} PROPERTIES
	DEBUG_POSTFIX "d"
)

#安装库
set(version 1.0)
#设置安装的头文件
set_target_properties(${PROJECT_NAME} PROPERTIES
	PUBLIC_HEADER "${H_FILE_I}"
)
install(TARGETS ${PROJECT_NAME}
	EXPORT ${PROJECT_NAME}
	RUNTIME DESTINATION bin
	LIBRARY DESTINATION lib
	PUBLIC_HEADER DESTINATION include
)

#支持find_package
install(EXPORT ${PROJECT_NAME} FILE ${PROJECT_NAME}Config.cmake
	DESTINATION lib/config/${PROJECT_NAME}-${version}
)

#版本文件
include(CMakePackageConfigHelpers)
write_basic_package_version_file(
	${CMAKE_CURRENT_LIST_DIR}/../../lib/conf/${PROJECT_NAME}-${version}/${PROJECT_NAME}ConfigVersion.cmake
	VERSION ${version}
	COMPATIBILITY SameMajorVersion  # 版本兼容问题
)
install(FILES ${CMAKE_CURRENT_LIST_DIR}/../../lib/conf/${PROJECT_NAME}-${version}/${PROJECT_NAME}ConfigVersion.cmake
	DESTINATION lib/config/${PROJECT_NAME}-${version}
)