#!/bin/env bash

# if -h or --help is given, print the usage
if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo "Usage: $0 [.netrc file]"
    echo "Usage: $0 -h|--help"
    exit 0
fi

# if no arguments are given, use .netrc
if [ -z "$1" ]; then
    file=$HOME/.netrc
else
    file=$1
fi

curl -s --netrc-file $file https://api.github.com/user/repos | jq '.[].html_url' | sed "s/[\"\/]/ /g" | awk '{print $4}'
