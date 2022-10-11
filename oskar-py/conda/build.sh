pkgv=$(sed 's/dev//g' <<< "$PKG_VERSION")

git clone --branch "$pkgv" https://github.com/i4Ds/OSKAR.git

cd OSKAR/python
$PYTHON -m pip install --no-deps .
