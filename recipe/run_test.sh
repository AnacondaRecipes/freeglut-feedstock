#!/bin/bash

set -eo pipefail

export PKG_CONFIG_PATH="${BUILD_PREFIX}/bin/pkg-config:${BUILD_PREFIX}/lib/pkgconfig:${PREFIX}/bin/pkg-config:${PREFIX}/lib/pkg-config"
export PKG_CONFIG_EXECUTABLE=${PREFIX}/bin/pkg-config

export CFLAGS="$(pkg-config --cflags  --libs glut gl xext x11)"

# Test linking against glut with CMake
cd test

cmake -GNinja -DCMAKE_BUILD_TYPE=Release "$CFLAGS" .

cmake --build . --config Release

./test
