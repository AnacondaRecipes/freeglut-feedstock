#!/bin/bash

set -eo pipefail

export PKG_CONFIG_PATH="${BUILD_PREFIX}/bin/pkg-config:${BUILD_PREFIX}/lib/pkgconfig:${PREFIX}/bin/pkg-config:${PREFIX}/lib/pkg-config"
export PKG_CONFIG_EXECUTABLE=${PREFIX}/bin/pkg-config

mkdir build && cd build
cmake -LAH -G "Ninja" \
    ${CMAKE_ARGS} \
	-DCMAKE_INSTALL_PREFIX=$PREFIX          \
	-DCMAKE_INSTALL_LIBDIR=$PREFIX/lib      \
	-DCMAKE_BUILD_TYPE=Release              \
	-DFREEGLUT_REPLACE_GLUT=ON              \
	-DFREEGLUT_BUILD_DEMOS=OFF              \
	-DFREEGLUT_BUILD_STATIC_LIBS=OFF        \
	-DFREEGLUT_BUILD_SHARED_LIBS=ON         \
	..

ninja -j${CPU_COUNT}
ctest --output-on-failure
ninja install
