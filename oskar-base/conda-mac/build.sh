#mkdir -p $PREFIX
#CC=$CC CXX=$CXX
# for some reason without the extra LICENCE call the build tells that it doesn't exists and thus fails
wget https://github.com/OxfordSKA/OSKAR/blob/master/LICENSE

pkgv=$(sed 's/dev//g' <<< "$PKG_VERSION")

mkdir tmp
cd tmp
git clone --branch "$pkgv" https://github.com/OxfordSKA/OSKAR.git .
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX
make -j install
cd ..
rm -rf tmp
#
#export OSKAR_INC_DIR=$CONDA_PREFIX/include
#export OSKAR_LIB_DIR=$CONDA_PREFIX/lib
#
#cd $SRC_DIR/python && $PYTHON -m pip install .  -vv
