mkdir ~/oskar
cp -r oskar/. $HOME/oskar
echo "ls"
ls $HOME/oskar
export OSKAR_LIB_DIR="$HOME/oskar/lib"
export OSKAR_INC_DIR="$HOME/oskar/include"
#git clone https://github.com/i4Ds/OSKAR.git
#cd OSKAR/python
#python3 setup.py install --user --prefix=
pip3 install --user 'git+https://github.com/i4Ds/OSKAR.git@master#egg=oskarpy&subdirectory=python'
#pip3 install --user --global-option=build_ext --global-option="-L~/oskar/lib" 'git+https://github.com/i4Ds/OSKAR.git@master#egg=oskarpy&subdirectory=python'