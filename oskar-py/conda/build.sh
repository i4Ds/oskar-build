git clone -b $PKG_VERSION https://github.com/OxfordSKA/OSKAR.git

cd OSKAR/python

export OSKAR_INC_DIR=$PREFIX/include
export OSKAR_LIB_DIR=$PREFIX/lib

$PYTHON -m pip install --no-deps .
