#!/bin/bash

set -e

#Absoulte path
arg1=$(readlink -f $1)

#Changing working directory
DIR=$(dirname $arg1)
cd $DIR

#Getting filenames of source code and executable
filename_c=$(basename -- $arg1)
#extension="${filename_c##*.}"
filename="${filename_c%.*}"

#echo "Compiling..."
printf "###\n"

gcc $filename_c -o $filename
sudo chmod u+x $filename

shift 1
./$filename "$@"

printf "\n### Exit Status: $?\n"
