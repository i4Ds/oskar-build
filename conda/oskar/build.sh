mkdir -p $PREFIX
cmake -DCUDA_ARCH="3.5;3.7;5.0;5.2;6.0;6.1;6.2;7.0;7.5" -DNVCC_COMPILER_BINDIR=$CXX -DCMAKE_INSTALL_PREFIX=$PREFIX
make -j install

export OSKAR_INC_DIR=$PREFIX/include
export OSKAR_LIB_DIR=$PREFIX/lib

cd $SRC_DIR/python && $PYTHON -m pip install .  -vv
