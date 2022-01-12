## Precompiled OSKAR Binaries for use as command line tool and python interface.

This repo builds binaries for Linux based systems (for now only Ubuntu) for [OSKAR](https://github.com/OxfordSKA/OSKAR), a SKA radio astronomy simulation software.

## Installation on Ubuntu

Prerequisites:

- Git
- wget
- python3
- pip3

This will download precompiled OSKAR Binares for Ubuntu Linux and put them in a user space folder, meaning no sudo rights are necessary.
The binaries contain all dependencies (including casacore) for running oskar from the command line and via the python interface.

```shell
wget -O - https://raw.githubusercontent.com/i4Ds/oskar-build/master/install-package.sh | bash -s ~/oskar
```

This command will install the binaries in the ~/oskar folder on your system (see at the end of the command). This position can be freely adjusted, however make sure you have write-permissions to the folder.
