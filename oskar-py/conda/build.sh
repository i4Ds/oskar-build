# for some reason without the extra LICENCE call the build tells that it doesn't exists and thus fails
wget https://github.com/i4Ds/OSKAR/blob/master/LICENSE

pkgv=$(sed 's/dev//g' <<< "$PKG_VERSION")

git clone --branch "$pkgv" https://github.com/OxfordSKA/OSKAR.git
#git clone https://github.com/i4Ds/OSKAR.git

cd OSKAR/python
export OSKAR_LIB_DIR=$CONDA_PREFIX/lib
export OSKAR_INC_DIR=$CONDA_PREFIX/include
$PYTHON -m pip install --no-deps .
