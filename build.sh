#!/bin/bash
set -e

START_DIR=$(pwd)

SRC_DIR=$HOME/src-folder
PACKAGE_DIR=$HOME/binary-package

FFTW_VERSION=3.3.10
FFTW3_SRC_DIR=$SRC_DIR/fftw3
FFTW3_BUILD_DIR=$FFTW3_SRC_DIR/build

LAPACK_VERSION=3.10.0
LAPACK_SRC_DIR=$SRC_DIR/lapack
LAPACK_BUILD_DIR=$LAPACK_SRC_DIR/build

CASACORE_VERSION=3.4.0
CASACORE_SRC_DIR=$SRC_DIR/casacore
CASACORE_BUILD_DIR=$CASACORE_SRC_DIR/build
CASACORE_INSTALL_DIR=$PACKAGE_DIR/

OSKAR_VERSION=2.7.6
OSKAR_SRC_DIR=$SRC_DIR/oskar
OSKAR_BUILD_DIR=$OSKAR_SRC_DIR/build
OSKAR_INSTALL_DIR=$PACKAGE_DIR/

mkdir -p "$LAPACK_SRC_DIR"
mkdir -p "$LAPACK_BUILD_DIR"

mkdir -p "$FFTW3_SRC_DIR"
mkdir -p "$FFTW3_BUILD_DIR"

mkdir -p "$CASACORE_SRC_DIR"
mkdir -p "$CASACORE_BUILD_DIR"
mkdir -p "$CASACORE_INSTALL_DIR"

mkdir -p "$OSKAR_SRC_DIR"
mkdir -p "$OSKAR_BUILD_DIR"
mkdir -p "$OSKAR_INSTALL_DIR"

cd "$SRC_DIR" || exit

echo "*- download fftw3 --------------------------------------------------------------------------- *"

wget https://www.fftw.org/fftw-$FFTW_VERSION.tar.gz -O fftw3.tar.gz
tar -xf fftw3.tar.gz -C "$FFTW3_SRC_DIR"

echo "*- build fftw3 ------------------------------------------------------------------------------ *"

cd "$FFTW3_BUILD_DIR" || exit
cmake "$FFTW3_SRC_DIR/fftw-$FFTW_VERSION"
"$FFTW3_SRC_DIR"/fftw-$FFTW_VERSION/configure --prefix=$PACKAGE_DIR --enable-threads --enable-float --enable-shared --disable-fortran
make
make install
make clean

"$FFTW3_SRC_DIR"/fftw-$FFTW_VERSION/configure --prefix=$PACKAGE_DIR --enable-threads --enable-shared --disable-fortran
make
make install
make clean

echo "*- download lapack -------------------------------------------------------------------------- *"

wget https://github.com/Reference-LAPACK/lapack/archive/refs/tags/v$LAPACK_VERSION.tar.gz -O lapack.tar.gz
tar -xf lapack.tar.gz -C "$LAPACK_SRC_DIR"

echo "*- build lapack ----------------------------------------------------------------------------- *"

cd "$LAPACK_BUILD_DIR" || exit
cmake -DCMAKE_INSTALL_LIBDIR=$PACKAGE_DIR/lib -DBUILD_SHARED_LIBS=ON "$LAPACK_SRC_DIR/lapack-$LAPACK_VERSION"
cmake --build . -j --target install


echo "*- download casacore ----------------------------------------------------------------------- *"

wget https://github.com/casacore/casacore/archive/refs/tags/v$CASACORE_VERSION.tar.gz -O casacore.tar.gz
tar -xf casacore.tar.gz -C "$CASACORE_SRC_DIR"
cd "$CASACORE_BUILD_DIR" || exit

echo "*- build casacore -------------------------------------------------------------------------- *"

cmake "$CASACORE_SRC_DIR/casacore-$CASACORE_VERSION" \
  -DBUILD_PYTHON=OFF \
  -DMODULE=ms \
  -DBUILD_TESTING=OFF \

make -j8
make DESTDIR="$CASACORE_INSTALL_DIR" install
#LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CASACORE_INSTALL_DIR/usr/local/lib

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
  -DCASACORE_INC_DIR="$CASACORE_INSTALL_DIR"/usr/local/include

make
echo "*- Installing Oskar ------------------------------------------------------------------------ *"
make install

echo "*- Taring package -------------------------------------------------------------------------- *"

cd $START_DIR
cp -r telescope.tm ~/binary-package/.
cp test.py ~/binary-package/.
cd $HOME/binary-package/
tar -zcf binaries-Linux.tar.gz *
