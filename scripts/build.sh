#! /bin/bash
# Make Variables
dir=$(pwd)
pkg=diablo-project-manager
mkdir -p $dir/build
shc -f "$dir/scripts/$pkg.sh" -o "$dir/build/$pkg"
shc -f "$dir/scripts/install.sh" -o "$dir/build/install"
