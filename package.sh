#!/bin/sh

#Set directories
OSKAR_SRC_DIR=$HOME/workspace/oskar
OSKAR_BUILD_DIR=$HOME/workspace/oskar/build
OSKAR_INSTALL_DIR=$HOME/package-$RUNNER_OS/oskar
CASACORE_DOWNLOAD_DIR=$HOME/workspace/casacore
CASACORE_PACKAGE_DIR=$HOME/workspace/casacore/tmp

echo "*- Download CASACORE ----------------------------------------------------------------------- *"

mkdir -p $CASACORE_DOWNLOAD_DIR
mkdir -p $CASACORE_PACKAGE_DIR
cd $CASACORE_DOWNLOAD_DIR
apt-get download casacore-dev
dpkg-deb -R casacore-dev*.deb $CASACORE_PACKAGE_DIR
CASACORE_INC_DIR=$CASACORE_PACKAGE_DIR/usr/include/casacore
CASACORE_LIB_DIR=$CASACORE_PACKAGE_DIR/usr/lib/x86_64-linux-gnu
#CASACORE_LIBRARIES=$CASACORE_LIB_DIR
echo $CASACORE_LIB_DIR
echo $CASACORE_INC_DIR

echo "*- download oskar -------------------------------------------------------------------------- *"
#build and install oksar
mkdir -p $OSKAR_SRC_DIR
git clone https://github.com/OxfordSKA/OSKAR.git $OSKAR_SRC_DIR
echo "*- starting oskar build -------------------------------------------------------------------- *"

mkdir -p $OSKAR_BUILD_DIR
cd $OSKAR_BUILD_DIR
cmake -E env LDFLAGS="-rpath:$CASACORE_LIB_DIR" $OSKAR_SRC_DIR -DFIND_CUDA=OFF  -DCMAKE_INSTALL_PREFIX=$OSKAR_INSTALL_DIR
make -j4
echo "*- Installing Oskar ------------------------------------------------------------------------ *"
mkdir -p $OSKAR_INSTALL_DIR
make install
echo "*- Test Oskar ------------------------------------------------------------------------------ *"
#ctest

echo "*- Making package -------------------------------------------------------------------------- *"
cd $HOME/work/oskar_build
ls .
cp install.sh package-$RUNNER_OS/
cp test.sh package-$RUNNER_OS/
cp test.py package-$RUNNER_OS/
tar -zcf oskar-binaries-$RUNNER_OS-x86_64.tar.gz package-$RUNNER_OS

