#!/bin/bash

branch=${GITHUB_REF##*/}
version_array=(${branch//./ })
patches=${version_array[2]}
if [[ ${patches:0:3} == dev ]]
then
    label=dev
else
    label=main
fi
echo "VERSION=$branch" >> $GITHUB_ENV
echo "LABEL=$label" >> $GITHUB_ENV