#!/bin/env bash

# run git pull on all the repos in a directory
# optionally take an argument for the path to the directory
# Version: 1.0.0
# Author: J. Lee
# Date: 2023-02-03
# License: MIT
# Usage: gitpull.sh [path]
# Example: gitpull.sh /home/admin/repos
# Example: gitpull.sh
# Example: gitpull.sh .

# if -h or --help is given, print the usage
if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo "Usage: gitpull.sh [path]"
    echo "Example: gitpull.sh /home/admin/repos"
    echo "Example: gitpull.sh"
    echo "Example: gitpull.sh ."
    exit 0
fi

# if no arguments are given, use the current directory
if [ -z "$1" ]; then
    path=$(pwd)
else
    path=$1
fi

# go to the repo
cd $path

# pull the latest changes from all the repos in the directory

# get a list of all the repos
repos=$(find . -name .git -type d -prune)

# loop through the repos
for repo in $repos; do
    # debug output
    echo "Pulling changes from $repo"

    # go to the repo
    cd $repo/..
    # pull the latest changes
    git pull

    # go back to the original directory
    cd -

    # debug output
    #echo "PWD: $(pwd)"
done

echo "Done."