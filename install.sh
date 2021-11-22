#!/bin/sh

CDIR=$(pwd)
mkdir $CDIR/oskar_
cp -r oskar/. $CDIR/oskar_
echo "ls"
ls $CDIR/oskar_
export OSKAR_LIB_DIR="$CDIR/oskar_/lib"
export OSKAR_INC_DIR="$CDIR/oskar_/include"
#git clone https://github.com/i4Ds/OSKAR.git
#cd OSKAR/python
#python3 setup.py install --user --prefix=
pip3 install --user 'git+https://github.com/i4Ds/OSKAR.git@master#egg=oskarpy&subdirectory=python'
#pip3 install --user --global-option=build_ext --global-option="-L~/oskar/lib" 'git+https://github.com/i4Ds/OSKAR.git@master#egg=oskarpy&subdirectory=python'
