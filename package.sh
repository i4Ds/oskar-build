#!/bin/sh

#Set directories
OSKAR_SRC_DIR=$HOME/workspace/oskar
OSKAR_BUILD_DIR=$HOME/workspace/oskar/build
OSKAR_INSTALL_DIR=$HOME/package-$RUNNER_OS/oskar
CASACORE_INSTALL_DIR=$HOME/workspace/casacore

echo "*- creating folders ------------------------------------------------------------------------ *"
echo $OSKAR_SRC_DIR

mkdir -p $CASACORE_INSTALL_DIR


echo "*- folders created ------------------------------------------------------------------------- *"

#download casacore
#cd $CASACORE_INSTALL_DIR
#apt-get download casacore-dev
#ls

echo "*- download oskar -------------------------------------------------------------------------- *"
#build and install oksar
mkdir -p $OSKAR_SRC_DIR
git clone https://github.com/OxfordSKA/OSKAR.git $OSKAR_SRC_DIR
echo "*- starting oskar build -------------------------------------------------------------------- *"

mkdir -p $OSKAR_BUILD_DIR
cd $OSKAR_BUILD_DIR
cmake $OSKAR_SRC_DIR -DFIND_CUDA=OFF -DCMAKE_INSTALL_PREFIX=$OSKAR_INSTALL_DIR
make -j4
echo "*- Installing Oskar ------------------------------------------------------------------------ *"
mkdir -p $OSKAR_INSTALL_DIR
make install
echo "*- Test Oskar ------------------------------------------------------------------------------ *"
ctest

echo "*- Making package -------------------------------------------------------------------------- *"
cd $HOME
cp install.sh package-$RUNNER_OS/
cp test.sh package-$RUNNER_OS/
cp test.py package-$RUNNER_OS/
tar -zcf oskar-binaries-$RUNNER_OS-x86_64.tar.gz package-$RUNNER_OS

