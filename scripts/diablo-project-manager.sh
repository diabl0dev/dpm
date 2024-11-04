#! /bin/bash

_pkgname=diablo-project-manager
_author=Diablo2009
_license=MIT
_version=1.0
_home="$(echo ~)"
_dir="$_home/Projects"

usage () {
    echo "$_pkgname [OPTION] project_name"
    echo ""
    echo "  -h: display this help message"
    echo "  -n: make a new project"
    echo "  -r: delete a project"
    echo "  -v: display version info and exit"
    echo "  -a: display about info and exit"
    exit 0
}

about () {
    echo "$_pkgname - Diablo Project Manager"
    echo "By: $_author, Licensed under the $_license license."
    exit 0
}

version () {
    echo "$_pkgname v$_version"
    exit 0
}

error () {
    echo "Error: $1"
    exit 1
}

warning () {
    "Warning: $1"
}

new () {
    if [[ ! -d "$_dir/$1" ]]; then
        mkdir -p "$_dir/$1"
        git init -q "$_dir/$1"
        echo "Project Created At $_dir/$1"
    else
        local err="Project Already Exists"
        error "$err"
    fi
    exit 0
}

delete () {
    if [[ -d "$_dir/$1" ]]; then
        rm -rf "$_dir/$1"
    else
        local err="Project Not Found"
        error "$err"
    fi
    exit 0
}

while getopts havn:r:? arg
do
    case $arg in
        h)
            usage;;
        a)
            about;;
        v)
            version;;
        n)
            new "$OPTARG";;
        r)
            delete "$OPTARG";;
        ?)
            usage;;
    esac
done
