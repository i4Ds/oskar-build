
mkdir binaries
mkdir workspace
mkdir package
mkdir package/oskar
cd workspace
git clone https://github.com/OxfordSKA/OSKAR.git .
mkdir build
cd build
cmake .. -DFIND_CUDA=OFF -DCMAKE_INSTALL_PREFIX=../../package/oskar
make -j4
make install
cd ..
cd python
export OSKAR_INC_DIR=../../package/oskar
export OSKAR_LIB_DIR=../../package/oskar
python3 setup.py bdist_wheel -w ../../package
cd ../..
tar -zcf oskar-binaries-$RUNNER_OS-x86_64.tar.gz install_dir
ls ../
