#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "xlog" for configuration "Debug"
set_property(TARGET xlog APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(xlog PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/xlogd.dll"
  )

list(APPEND _cmake_import_check_targets xlog )
list(APPEND _cmake_import_check_files_for_xlog "${_IMPORT_PREFIX}/bin/xlogd.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
