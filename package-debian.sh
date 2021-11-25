#!/bin/sh

$NAME="OSKAR"
$VERSION="1.0"
$REVISION="0"
$ARCHITECTURE="amd64"

$PACKAGE_NAME=$OSKAR_$VERSION-$REVISON_$ARCHITECTURE

mkdir $PACKAGE_NAME

$BIN_DIR=$PACKAGE_NAME/usr/local/bin
$LIB_DIR=$PACKAGE_NAME/usr/local/lib
$INC_DIR=$PACKAGE_NAME/usr/local/include

mkdir -p $BIN_DIR
mkdir -p $LIB_DIR
mkdir -p $INC_DIR

cp -r oskar/bin/* $BIN_DIR
cp -r oskar/lib/* $LIB_DIR
cp -r oskar/include/* $INC_DIR

mkdir $PACKAGE_NAME/DEBIAN

touch $PACKAGE_NAME/DEBIAN/control

cat > $PACKAGE_NAME/DEBIAN/control <<- EOM
     Package: $PACKAGE_NAME
     Version: $VERSION
     Architecture: $ARCHITECTURE
     Maintainer: Christoph Vögele <christoph.voegele@fhnw.ch>
     Description: SKA Simulation Software
     EOM

dpkg-deb --build --root-owner-group $PACKAGE_NAME
