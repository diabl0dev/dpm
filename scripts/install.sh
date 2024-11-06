#! /bin/bash
_dir=$(pwd)
_cmd="/usr/bin/install"

if [[ ! -f "$_dir/diablo-project-manager" ]]; then
    echo "Cannot Found Built Binaries in current folder (Are you in the right folder/Did you build them?)"
    exit 1
fi



if [[ $PREFIX == "" ]]; then
    PREFIX="/usr"
fi

if [[ "$PREFIX" == "$HOME" ]]; then
    $_cmd -D -o $(whoami) -g $(whoami) -m 755 "$_dir/diablo-project-manager" "$PREFIX/bin/diablo-project-manager"
else
    /usr/bin/install -D -o root -g root -m 755 "$_dir/diablo-project-manager" "$PREFIX/bin/diablo-project-manager"
fi
