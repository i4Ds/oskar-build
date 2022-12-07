
# for some reason without the extra LICENCE call the build tells that it doesn't exists and thus fails
wget https://github.com/OxfordSKA/OSKAR/blob/master/LICENSE

pkgv=$(sed 's/dev//g' <<< "$PKG_VERSION")
echo $pkgv
echo $CUDA_PATH
mkdir tmp
cd tmp
git clone --branch "$pkgv" https://github.com/OxfordSKA/OSKAR.git .
cmake -DCFIND_CUDA=ON -DCMAKE_INSTALL_PREFIX=$PREFIX -DCUDA_ARCH="7.5:8.0:8.6;8.7"
make -j2 install
cd ..
rm -rf tmp
