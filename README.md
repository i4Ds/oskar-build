## Compiled Conda Packages for OSKAR

## Installation

```shell
conda install -c i4ds oskar
```

Requires you to have the conda-forge channel enabled in the environment, you wish to install oskar into.

```shell
conda config --append channel conda-forge
#or install with conda-forge channel in the install command
conda install -c i4ds -c conda-forge oskar
```


### Why Conda?

To enable a simple Installation, with no compilation or other issues, conda is the perfect platform for scientific computing.
As OSKAR has a c++ backend compilation is required. Conda allows us to bundle all requirements very easily and distribute them to the users.
