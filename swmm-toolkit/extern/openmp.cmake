#
# CMakeLists.txt - CMake configuration file for OpenMP Library on Darwin
#
# Created: Mar 17, 2021
# Updated: May 19, 2021
#
# Author: Michael E. Tryby
#         US EPA ORD/CESER
#
# Note:
#  Need to build libomp for binary compatibility with Python.
#
#  OpenMP library build fails for Xcode generator. Use Ninja or Unix Makefiles
#  instead.
#

################################################################################
#####################    CMAKELISTS FOR OPENMP LIBRARY    ######################
################################################################################

include(FetchContent)


FetchContent_Declare(
    OpenMP
    URL
        https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.0/openmp-14.0.0.src.tar.xz
    URL_HASH
        SHA256=28a1cbdd3dfdd331e4ed2dda2b4477fc418e455c883bd0d1d6acc331118e4688
)

set(OPENMP_STANDALONE_BUILD TRUE)
set(LIBOMP_INSTALL_ALIASES OFF)

FetchContent_MakeAvailable(OpenMP)
set(OpenMP_AVAILABLE TRUE)


target_link_directories(omp
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_BINARY_DIR}/_deps/openmp-build/runtime/src>
        $<INSTALL_INTERFACE:${LIBRARY_DIST}>
)

install(TARGETS omp
    LIBRARY
    DESTINATION
        "${LIBRARY_DIST}"
)
