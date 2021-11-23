#!/bin/sh

START_DIR=$(pwd)
#Set directories
OSKAR_SRC_DIR=$START_DIR/workspace/oskar
OSKAR_BUILD_DIR=$START_DIR/workspace/oskar/build
OSKAR_INSTALL_DIR=$START_DIR/package-$RUNNER_OS/oskar
CASACORE_DOWNLOAD_DIR=$START_DIR/workspace/casacore
CASACORE_PACKAGE_DIR=$START_DIR/package-$RUNNER_OS/casacore

echo "*- Download CASACORE ----------------------------------------------------------------------- *"

mkdir -p $CASACORE_DOWNLOAD_DIR
mkdir -p $CASACORE_PACKAGE_DIR
cd $CASACORE_DOWNLOAD_DIR
#apt-get update
#apt-get install -y casacore-dev
apt-get download casacore-dev
dpkg-deb -R casacore-dev*.deb $CASACORE_PACKAGE_DIR
mkdir $CASACORE_PACKAGE_DIR/lib
mv -r $CASACORE_PACKAGE_DIR/usr/lib/x86_64-linux-gnu $CASACORE_PACKAGE_DIR/lib
CASACORE_INC_DIR=$CASACORE_PACKAGE_DIR/usr/include/casacore
CASACORE_LIB_DIR=$CASACORE_PACKAGE_DIR/lib
#CASACORE_LIBRARIES=$CASACORE_LIB_DIR
#ls $CASACORE_LIB_DIR
#echo $CASACORE_INC_DIR

echo "*- download oskar -------------------------------------------------------------------------- *"
#build and install oksar
mkdir -p $OSKAR_SRC_DIR
git clone https://github.com/OxfordSKA/OSKAR.git $OSKAR_SRC_DIR
echo "*- starting oskar build -------------------------------------------------------------------- *"

mkdir -p $OSKAR_BUILD_DIR

#cd $CASACORE_LIB_DIR
#for filename in *.so; do
#        ld -l:"$filename" --verbose
#done

cd $OSKAR_BUILD_DIR
cmake $OSKAR_SRC_DIR -DFIND_CUDA=OFF -DCASACORE_LIB_DIR=$CASACORE_LIB_DIR -DCASACORE_INC_DIR=$CASACORE_INC_DIR -DCMAKE_INSTALL_PREFIX=$OSKAR_INSTALL_DIR
make -n
echo "*- Installing Oskar ------------------------------------------------------------------------ *"
mkdir -p $OSKAR_INSTALL_DIR
make install
echo "*- Test Oskar ------------------------------------------------------------------------------ *"
#ctest

echo "*- Package package ------------------------------------------------------------------------- *"
cd $START_DIR
ls .
cp install.sh package-$RUNNER_OS/
cp test.sh package-$RUNNER_OS/
cp test.py package-$RUNNER_OS/
echo "*- Taring package -------------------------------------------------------------------------- *"
tar -zcf oskar-binaries-$RUNNER_OS-x86_64.tar.gz package-$RUNNER_OS

