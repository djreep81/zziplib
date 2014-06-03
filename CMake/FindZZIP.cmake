################################################################################
# Custom cmake module for CEGUI to find zzip 
################################################################################
include(FindPackageHandleStandardArgs)

find_path(ZZIP_H_PATH NAMES zzip.h)
find_library(ZZIP_LIB NAMES zzip libzzip zzip libzzip PATH_SUFFIXES dynamic)
find_library(ZZIP_LIB_DBG NAMES zzipd libzzipd zzip_d libzzip_d PATH_SUFFIXES dynamic)
mark_as_advanced(ZZIP_H_PATH ZZIP_LIB ZZIP_LIB_DBG)

if (WIN32 OR APPLE)
    find_library(ZZIP_LIB_STATIC NAMES zzip libzzip zzip libzzip PATH_SUFFIXES static)
    find_library(ZZIP_LIB_STATIC_DBG NAMES zzipd libzzipd zzip_d libzzip_d PATH_SUFFIXES static)
    set( ZZIP_DEFINITIONS_STATIC "ZZIP_LIB" CACHE STRING "preprocessor definitions" )
    mark_as_advanced(ZZIP_DEFINITIONS_STATIC ZZIP_LIB_STATIC ZZIP_LIB_STATIC_DBG)
endif()

cegui_find_package_handle_standard_args(ZZIP ZZIP_LIB ZZIP_H_PATH)


# set up output vars
if (ZZIP_FOUND)
    set (ZZIP_INCLUDE_DIR ${ZZIP_H_PATH})
    set (ZZIP_LIBRARIES ${ZZIP_LIB})
    if (ZZIP_LIB_DBG)
        set (ZZIP_LIBRARIES_DBG ${ZZIP_LIB_DBG})
    endif()
    if (ZZIP_LIB_STATIC)
        set (ZZIP_LIBRARIES_STATIC ${ZZIP_LIB_STATIC})
    endif()
    if (ZZIP_LIB_STATIC_DBG)
        set (ZZIP_LIBRARIES_STATIC_DBG ${ZZIP_LIB_STATIC_DBG})
    endif()
else()
    set (ZZIP_INCLUDE_DIR)
    set (ZZIP_LIBRARIES)
    set (ZZIP_LIBRARIES_DBG)
    set (ZZIP_LIBRARIES_STATIC)
    set (ZZIP_LIBRARIES_STATIC_DBG)
endif()

