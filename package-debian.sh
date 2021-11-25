$NAME=OSKAR
$VERSION=1.0
$REVISION=0
$ARCHITECTURE=amd64

$PACKAGE_NAME=$OSKAR_$VERSION-$REVISON_$ARCHITECTURE

mkdir $PACKAGE_NAME

cp -r oskar/. $PACKAGE_NAME

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
