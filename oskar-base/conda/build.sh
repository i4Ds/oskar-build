
# for some reason without the extra LICENCE call the build tells that it doesn't exists and thus fails
wget https://github.com/OxfordSKA/OSKAR/blob/master/LICENSE

pkgv=$(sed 's/dev//g' <<< "$PKG_VERSION")
echo $pkgv
mkdir tmp
cd tmp
git clone --branch "$pkgv" https://github.com/OxfordSKA/OSKAR.git .
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX
make -j install
cd ..
rm -rf tmp
