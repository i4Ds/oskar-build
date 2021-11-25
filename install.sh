#!/bin/sh

OSKAR_INSTALL_DIR=$HOME/oskar

mkdir $OSKAR_INSTALL_DIR
cp -r oskar/. $OSKAR_INSTALL_DIR
export OSKAR_LIB_DIR=$OSKAR_INSTALL_DIR/lib
export OSKAR_INC_DIR=$OSKAR_INSTALL_DIR/include

pip3 install --user 'git+https://github.com/i4Ds/OSKAR.git@master#egg=oskarpy&subdirectory=python'
