mkdir -p $PREFIX
CC=$CC CXX=$CXX cmake -DCMAKE_INSTALL_PREFIX=$PREFIX
make -j install

export OSKAR_INC_DIR=$PREFIX/include
export OSKAR_LIB_DIR=$PREFIX/lib

cd $SRC_DIR/python && $PYTHON -m pip install .  -vv
