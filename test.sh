
wget -O data.zip https://github.com/OxfordSKA/OSKAR/files/1984210/OSKAR-2.7-Example-Data.zip

unzip data.zip
cp -r OSKAR-2.7-Example-Data/telescope.tm .

echo "check for dir site-packages"
dir=$(python3 -m site --user-site)
echo $dir
ls $dir/oskar

python3 test.py
ls
