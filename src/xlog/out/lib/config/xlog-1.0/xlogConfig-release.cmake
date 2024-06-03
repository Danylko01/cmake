#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "xlog" for configuration "Release"
set_property(TARGET xlog APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(xlog PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/xlog.dll"
  )

list(APPEND _cmake_import_check_targets xlog )
list(APPEND _cmake_import_check_files_for_xlog "${_IMPORT_PREFIX}/bin/xlog.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
