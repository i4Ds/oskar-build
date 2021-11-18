
mkdir binaries
mkdir workspace
cd workspace
git clone https://github.com/OxfordSKA/OSKAR.git .
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX="../binaries" -DFIND_CUDA=OFF
make -j4
cd ../..

ls .
tar -zcvf oskar-binaries-linux-x86_64.tar.gz ./binaries
