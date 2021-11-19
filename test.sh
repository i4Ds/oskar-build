
wget -O data.zip https://github.com/OxfordSKA/OSKAR/files/1984210/OSKAR-2.7-Example-Data.zip
ls
unzip data.zip
cp -r OSKAR-2.7-Example-Data/telescope.tm .

python3 test.py
