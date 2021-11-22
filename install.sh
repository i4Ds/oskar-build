#!/bin/sh

CDIR=$(pwd)
OSKAR_INSTALL_DIR=$HOME/oskar

mkdir $OSKAR_INSTALL_DIR
cp -r oskar/. $OSKAR_INSTALL_DIR
echo "ls"
ls $OSKAR_INSTALL_DIR
ls $OSKAR_INSTALL_DIR/lib
ls $OSKAR_INSTALL_DIR/include

export OSKAR_LIB_DIR="$OSKAR_INSTALL_DIR/lib"
export OSKAR_INC_DIR="$OSKAR_INSTALL_DIR/include"

#git clone https://github.com/i4Ds/OSKAR.git
#cd OSKAR/python
#python3 setup.py install --user --prefix=
pip3 install --user 'git+https://github.com/i4Ds/OSKAR.git@master#egg=oskarpy&subdirectory=python'
#pip3 install --user --global-option=build_ext --global-option="-L~/oskar/lib" 'git+https://github.com/i4Ds/OSKAR.git@master#egg=oskarpy&subdirectory=python'
