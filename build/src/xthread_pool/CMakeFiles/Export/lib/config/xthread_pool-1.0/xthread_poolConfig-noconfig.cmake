#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "xthread_pool" for configuration ""
set_property(TARGET xthread_pool APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(xthread_pool PROPERTIES
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libxthread_pool.so"
  IMPORTED_SONAME_NOCONFIG "libxthread_pool.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS xthread_pool )
list(APPEND _IMPORT_CHECK_FILES_FOR_xthread_pool "${_IMPORT_PREFIX}/lib/libxthread_pool.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
