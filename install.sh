mkdir ~/oskar
cp -r oskar/ ~/oskar
#export OSKAR_LIB_DIR="~/oskar/lib"
#export OSKAR_INC_DIR="~/oskar/include"
pip3 install 'git+https://github.com/OxfordSKA/OSKAR.git@master#egg=oskarpy&subdirectory=python'
#pip3 install --user --global-option=build_ext --global-option="-L~/oskar/lib" 'git+https://github.com/OxfordSKA/OSKAR.git@master#egg=oskarpy&subdirectory=python'
