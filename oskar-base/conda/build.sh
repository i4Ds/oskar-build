
# for some reason without the extra LICENCE call the build tells that it doesn't exists and thus fails
wget https://github.com/OxfordSKA/OSKAR/blob/master/LICENSE

pkgv=$(sed 's/dev//g' <<< "$PKG_VERSION")
echo $pkgv
echo $CUDA_PATH
mkdir tmp
cd tmp
git clone --branch "$pkgv" https://github.com/OxfordSKA/OSKAR.git .
cmake -DCFIND_CUDA=ON -DCMAKE_INSTALL_PREFIX=$PREFIX -DCUDA_ARCH="ALL"
make -j install
cd ..
rm -rf tmp
#
#export OSKAR_INC_DIR=$CONDA_PREFIX/include
#export OSKAR_LIB_DIR=$CONDA_PREFIX/lib
#
#mkdir -p $PREFIX
#cmake -DCFIND_CUDA=OFF -DCUDA_ARCH="3.5;3.7;5.0;5.2;6.0;6.1;6.2;7.0;7.5" -DNVCC_COMPILER_BINDIR=$CXX -DCMAKE_INSTALL_PREFIX=$PREFIX
#cd $SRC_DIR/python && $PYTHON -m pip install .  -vv
