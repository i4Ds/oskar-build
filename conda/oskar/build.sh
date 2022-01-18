mkdir -p $PREFIX
cmake -DFIND_CUDA=OFF -DCUDA_ARCH="7.0" -DNVCC_COMPILER_BINDIR=$CXX -DCMAKE_INSTALL_PREFIX=$PREFIX
make -j install

export OSKAR_INC_DIR=$PREFIX/include
export OSKAR_LIB_DIR=$PREFIX/lib

cd $SRC_DIR/python && $PYTHON -m pip install .  -vv
