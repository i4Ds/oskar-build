
mkdir binaries
mkdir workspace
mkdir package-$RUNNER_OS
mkdir package-$RUNNER_OS/oskar
cd workspace
git clone https://github.com/OxfordSKA/OSKAR.git .
cd ..
cd package-$RUNNER_OS/oskar
cmake ../../workspace/. -DFIND_CUDA=OFF #-DCMAKE_INSTALL_PREFIX=../../package/oskar
make -j4
cd ../..
tar -zcf oskar-binaries-$RUNNER_OS-x86_64.tar.gz package-$RUNNER_OS
ls ../
