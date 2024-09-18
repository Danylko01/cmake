#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "xlog" for configuration ""
set_property(TARGET xlog APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(xlog PROPERTIES
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libxlog.so"
  IMPORTED_SONAME_NOCONFIG "libxlog.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS xlog )
list(APPEND _IMPORT_CHECK_FILES_FOR_xlog "${_IMPORT_PREFIX}/lib/libxlog.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
