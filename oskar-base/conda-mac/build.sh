#mkdir -p $PREFIX
#CC=$CC CXX=$CXX
pkgv=$(sed 's/dev//g' <<< "$PKG_VERSION")

mkdir tmp
cd tmp
git clone --branch "$pkgv" https://github.com/OxfordSKA/OSKAR.git .
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX
make -j install
cd ..
rm -rf tmp
#
#export OSKAR_INC_DIR=$PREFIX/include
#export OSKAR_LIB_DIR=$PREFIX/lib

#cd $SRC_DIR/python && $PYTHON -m pip install .  -vv
