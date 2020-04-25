#!/bin/bash

set -e

arg1="$1"
filename=$(basename -- "$1")
#extension="${filename##*.}"
filename="${filename%.*}"

#echo "Compiling..."
printf "###\n"

gcc $arg1 -o $filename
sudo chmod u+x $filename

shift 1
$PWD/$filename "$@"

printf "\n###\n"
