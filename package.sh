mkdir binaries
mkdir workspace
mkdir package-$RUNNER_OS
mkdir package-$RUNNER_OS/oskar
cd workspace
git clone https://github.com/OxfordSKA/OSKAR.git .
mkdir build
cd build
cmake ../../workspace/. -DFIND_CUDA=OFF -DCMAKE_INSTALL_PREFIX=../../package-$RUNNER_OS/oskar
make -j4
make install
cd ../..
cp install.sh package-$RUNNER_OS/
tar -zcf oskar-binaries-$RUNNER_OS-x86_64.tar.gz package-$RUNNER_OS
ls ../
