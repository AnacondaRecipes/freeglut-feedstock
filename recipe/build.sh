#!/bin/bash
set -x

declare -a CMAKE_PLATFORM_FLAGS
if [[ ${HOST} =~ .*linux.* ]]; then
    CMAKE_PLATFORM_FLAGS+=(-DCMAKE_TOOLCHAIN_FILE="${RECIPE_DIR}/cross-linux.cmake")
fi

mkdir build && cd build
cmake \
	-DCMAKE_INSTALL_PREFIX=$PREFIX          \
	-DCMAKE_INSTALL_LIBDIR=$PREFIX/lib      \
	-DCMAKE_BUILD_TYPE=Release              \
        ${CMAKE_PLATFORM_FLAGS[@]}              \
	-DFREEGLUT_BUILD_DEMOS=OFF              \
	..
make
make install
