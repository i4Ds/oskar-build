## OSKAR Binaries for Linux Systems

This repo builds binaries for debian based systems (Debian, Ubuntu (including all its flavours and derivatives)) for [OSKAR](https://github.com/OxfordSKA/OSKAR), a SKA radio astronomy simulation software.

## Installation on Debian (Ubuntu)

### Explained

First install casacore from your package manager

```shell
sudo apt-get install casacore-dev
```

To install the packages, first download the .deb package from the [Release]() page.
Then install with dpkg.

```shell
sudo dpkg -i *.deb
```

A sample output for a successful installation should look something like this.
The version number of the package may vary.
```shell
Selecting previously unselected package oskar-1.0-0-amd64.
(Reading database ... 4127 files and directories currently installed.)
Preparing to unpack oskar-1.0-0-amd64.deb ...
Unpacking oskar-1.0-0-amd64 (1.0) ...
Setting up oskar-1.0-0-amd64 (1.0) ...
```

Now you have the oskar binaries ready to be used on your system. To use the oskar python interface install it with pip.
Make sure you have the correct pip of the correct environment in your path.
```shell
pip install --user 'git+https://github.com/i4Ds/OSKAR.git@master#egg=oskarpy&subdirectory=python'
```

## Remarks

- The installation requires sudo rights on your system. If there is a demand for user space installation, please open an issue.
- If you need binaries for another linux derivative, like OpenSUSE, Arch, etc. Please open an issue, so we see that there is demand.
