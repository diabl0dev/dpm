#! /bin/bash
_dir=$(pwd)

if [[ ! -f "$_dir/diablo-project-manager" ]]; then
    echo "Cannot Found Built Binaries in current folder (Are you in the right folder/Did you build them?)"
    exit 1
fi

if [[ $PREFIX == "" ]]; then
    PREFIX="/usr"
fi
/usr/bin/install -D -o root -g root -m 755 -m 755 "$_dir/diablo-project-manager" "$PREFIX/bin/diablo-project-manager"
