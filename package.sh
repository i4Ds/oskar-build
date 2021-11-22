mkdir binaries
mkdir workspace
mkdir package-$RUNNER_OS
mkdir package-$RUNNER_OS/oskar

#install casacore
cd workspace
mkdir casacore
cd casacore
apt-get download casacore-dev
cd ..

#install oksar
git clone https://github.com/OxfordSKA/OSKAR.git
cd oskar
mkdir build
cd build
cmake ../../../workspace/. -DFIND_CUDA=OFF -DCMAKE_INSTALL_PREFIX=../../package-$RUNNER_OS/oskar
make -j4
make install
ctest
cd ../../..
cp install.sh package-$RUNNER_OS/
cp test.sh package-$RUNNER_OS/
cp test.py package-$RUNNER_OS/
tar -zcf oskar-binaries-$RUNNER_OS-x86_64.tar.gz package-$RUNNER_OS
ls ../
