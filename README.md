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

To enable a simple Installation, with no compilation or other inconveniences, conda is the perfect platform for scientific computing.
As OSKAR has a c++ backend, meaning compilation is required. Conda allows us to do so and bundle all dependencies very easily and distribute them to the users.
