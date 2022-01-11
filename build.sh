#!/bin/bash
set -e

SRC_DIR=$HOME/src-folder
PACKAGE_DIR=$HOME/binary-package

CASACORE_VERSION=3.4.0
CASACORE_SRC_DIR=$SRC_DIR/casacore
CASACORE_BUILD_DIR=$CASACORE_SRC_DIR/build
CASACORE_INSTALL_DIR=$PACKAGE_DIR/casacore

OSKAR_VERSION=2.7.6
OSKAR_SRC_DIR=$SRC_DIR/oskar
OSKAR_BUILD_DIR=$OSKAR_SRC_DIR/build
OSKAR_INSTALL_DIR=$PACKAGE_DIR/oskar

mkdir -p "$CASACORE_SRC_DIR"
mkdir -p "$CASACORE_BUILD_DIR"
mkdir -p "$CASACORE_INSTALL_DIR"

mkdir -p "$OSKAR_SRC_DIR"
mkdir -p "$OSKAR_BUILD_DIR"
mkdir -p "$OSKAR_INSTALL_DIR"

cd "$SRC_DIR" || exit

echo "*- download casacore ----------------------------------------------------------------------- *"

wget https://github.com/casacore/casacore/archive/refs/tags/v$CASACORE_VERSION.tar.gz -O casacore.tar.gz
tar -xf casacore.tar.gz -C "$CASACORE_SRC_DIR"
cd "$CASACORE_BUILD_DIR" || exit

echo "*- build casacore -------------------------------------------------------------------------- *"

cmake "$CASACORE_SRC_DIR/casacore-$CASACORE_VERSION" \
  -DBUILD_PYTHON3=OFF -DBUILD_PYTHON=OFF \
  -DPYTHON3_EXECUTABLE=/usr/bin/python3.8 \
  -DPYTHON3_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython3.8.so.1 \
  -DPYTHON3_INCLUDE_DIR=/usr/include/python3.8 \

make -j8
make DESTDIR=$CASACORE_INSTALL_DIR install
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CASACORE_INSTALL_DIR/usr/local/lib

cd "$SRC_DIR" || exit

echo "*- download oskar -------------------------------------------------------------------------- *"

#build and install oskar
wget https://github.com/OxfordSKA/OSKAR/archive/refs/tags/$OSKAR_VERSION.tar.gz -O oskar.tar.gz
tar zxf oskar.tar.gz -C "$OSKAR_SRC_DIR"

echo "*- build oskar ----------------------------------------------------------------------------- *"

cd "$OSKAR_BUILD_DIR" || exit
cmake "$OSKAR_SRC_DIR/OSKAR-$OSKAR_VERSION" -DFIND_CUDA=OFF \
  -DCMAKE_INSTALL_PREFIX="$OSKAR_INSTALL_DIR" \
  -DCASACORE_LIB_DIR="$CASACORE_INSTALL_DIR"/usr/local/lib \
  -DCASACORE_INC_DIR="$CASACORE_INSTALL_DIR"/usr/local/include \

make
echo "*- Installing Oskar ------------------------------------------------------------------------ *"
make install

#echo "*- Package package ------------------------------------------------------------------------- *"
#cd $START_DIR || exit
#ls .
#cp install.sh package-$RUNNER_OS/
#cp test.sh package-$RUNNER_OS/
#cp test.py package-$RUNNER_OS/
echo "*- Taring package -------------------------------------------------------------------------- *"
cd $HOME/binary-package || exit
tar -zcf binaries-Linux-x86_64.tar.gz *
