
mkdir binaries
mkdir workspace
cd workspace
mkdir install_dir
git clone https://github.com/OxfordSKA/OSKAR.git .
mkdir build
cd build
cmake .. -DFIND_CUDA=OFF -DCMAKE_INSTALL_PREFIX=../install_dir
make -j4
make install
cd ..
tar -zcf ../oskar-binaries-$RUNNER_OS-x86_64.tar.gz ./install_dir
ls ../
