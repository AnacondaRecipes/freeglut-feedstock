#!/bin/bash

set -euxo pipefail

mkdir build && cd build
cmake -LAH -G "Ninja" \
    ${CMAKE_ARGS} \
	-DCMAKE_BUILD_TYPE=Release              \
	-DCMAKE_INSTALL_PREFIX=${PREFIX}        \
	-DCMAKE_PREFIX_PATH=${PREFIX}           \
	-DCMAKE_INSTALL_BINDIR=bin              \
	-DCMAKE_INSTALL_LIBDIR=lib              \
	-DCMAKE_INSTALL_INCLUDEDIR=include      \
	-DFREEGLUT_REPLACE_GLUT=ON              \
	-DFREEGLUT_BUILD_DEMOS=OFF              \
	-DFREEGLUT_BUILD_STATIC_LIBS=OFF        \
	-DFREEGLUT_BUILD_SHARED_LIBS=ON         \
	..

ninja -j${CPU_COUNT}
ninja install
