
INSTALL_DIR=$1
mkdir $INSTALL_DIR

#download archive
tar zxf binaries-*.tar.gz -C $INSTALL_DIR

export OSKAR_INC_DIR=$INSTALL_DIR/oskar/include
export OSKAR_LIB_DIR=$INSTALL_DIR/oskar/lib

# shellcheck disable=SC2016
LIBRARY_PATH='LD_LIBRARY_PATH=$LD_LIBRARY_PATH:'

echo "export ${LIBRARY_PATH}${INSTALL_DIR}/usr/local/lib" >> ~/.bashrc
echo "export ${LIBRARY_PATH}${INSTALL_DIR}/lib" >> ~/.bashrc

export ${LIBRARY_PATH}${INSTALL_DIR}/usr/local/lib
export ${LIBRARY_PATH}${INSTALL_DIR}/lib

pip3 install --user 'git+https://github.com/OxfordSKA/OSKAR.git@2.7.6#egg=oskarpy&subdirectory=python'
