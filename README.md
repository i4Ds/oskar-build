Compiled Conda Packages for OSKAR
===========================================================

The repository is for building different Anaconda packages from [OSKAR](https://github.com/OxfordSKA/OSKAR) with different versions. For this the following setup is provided:

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

## Version Management
- **IMPORTANT:** The version as well as the dev management is derived from the branch name. So you ALWAYS have to set a branch-name to `major.minor.patches` releases, e.g. `0.0.3`. You do not have to change anything else.
- From the `main` branch different branches are created for each version. If changes should be distributed from the `main` branch, it can be merged into the corresponding version branch. The `main` branch should never form a new version, but is only used for orchestration.
 
## Dev Management
- **IMPORTANT:** So that existing builds, which are needed for the user installations, are not overwritten if a change of the build is required, so-called `dev` branches should be created from the main or version branches. For these it is mandatory to **change the branch-name** (following the in *Version Management* described pattern) to [PEP 440](https://peps.python.org/pep-0440/) comforme dev naming. An example would be version `0.0.3` becomes `0.0.dev3`. This procedure will automatically set the Anaconda build labels to either `main` or `dev`. This is common setup according to [Anaconda Documentation](https://docs.anaconda.com/anacondaorg/user-guide/tutorials/).
- A push of a `dev` branch triggers a build and can be referenced using `conda install -c i4ds -c conda-forge oskar=<version>` where `<version>` e.g. `0.0.dev3`. So once the `dev` build has been tested, it can be merged (or created) into the corresponding version branch, which triggers a new build of the corresponding non-dev-version.
- To include the `dev` builds in the current development, the `environment.yaml` can be adjusted to the corresponding package, version and channel.
- It is strongly recommended to first build `dev` builds because if the label is `main`, conda installations without a version reference automatically fetch the latest version. This is usually not a desired outcome if a build is not tested yet.

## Additional Information
- For safety, the upload to the [Anaconda Registry](https://anaconda.org) does not have a `--force` included per default. This means that when publishing, the existing package must be removed manually or the upload must be forced in the specific branch. It is recommended to archive the archive the previous build before a build is overwritten or removed.
- The builds are triggered of GitHub Actions from branches following the [glob pattern](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#filter-pattern-cheat-sheet) `[0-9]*.[0-9]*.[dev0-9]*` on pushes and pull requests.
- If you just want to merge the changes from main into a version branch, but not trigger a build from GitHub Actions, just set something like `[skip ci]` (see [Skipping workflow runs](https://docs.github.com/en/actions/managing-workflow-runs/skipping-workflow-runs)) in your commit message. 