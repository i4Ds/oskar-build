mkdir ~/oskar
cp -r oskar/ ~/oskar
export OSKAR_INC_DIR=~/oskar/include
export OSKAR_LIB_DIR=~/oskar/
pip3 install --user 'git+https://github.com/OxfordSKA/OSKAR.git@master#egg=oskarpy&subdirectory=python'

