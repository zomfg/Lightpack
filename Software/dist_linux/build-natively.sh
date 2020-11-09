#!/bin/sh

[ -z $1 ] && echo "Usage: $0 (dpkg|pacman|flatpak)" && exit 1
pkgmgr=$1

echo $pkgmgr
set -xe
cd "$pkgmgr"
./build.sh
