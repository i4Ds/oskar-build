## Precompiled OSKAR Binaries for use as command line tool or python interface.

This repo builds binaries for Linux based systems (for now only Ubuntu) for [OSKAR](https://github.com/OxfordSKA/OSKAR), a SKA radio astronomy simulation software.

## Installation on Debian (Ubuntu)


This will download precompiled Binares for Ubuntu Linux and put them in a user space folder, meaning no sudo rights are necessary.
The binaries contain all dependencies for running oskar from the command line or via the python interface.

```shell
wget -O - https://raw.githubusercontent.com/i4Ds/oskar-build/master/install-package.sh | bash -s ~/oskar
```

This command will install the binaries in the ~/oskar folder on your system. This position can be freely adjusted, however make sure you have write-permissions to the folder.
