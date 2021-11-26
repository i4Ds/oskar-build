## OSKAR Binaries for Linux Systems

This repo builds binaries for debian based systems (Debian, Ubuntu (including all its flavours and derivatives)) for [OSKAR](), a SKA radio astronomy simulation software.

First install casacore from your package manager

```shell
sudo apt-get install casacore-dev
```

To install the packages, first download the .deb package from the [Release]() page.
Then install with dpkg.

```shell
sudo dpkg -i *.deb
```

Now you have the oskar binaries ready to be used on your system. To use the 

