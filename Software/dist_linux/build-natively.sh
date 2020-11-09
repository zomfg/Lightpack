#!/bin/sh

[ -z $1 ] && echo "	Usage: $0 (dpkg|pacman|flatpak)" && exit 1
pkgmgr=$1

echo $pkgmgr

(which lsb_release 2> /dev/null) && lsb_release -a
(which qmake 2> /dev/null) && qmake -v
(which gcc 2> /dev/null) && gcc -v
(which lscpu 2> /dev/null) && lscpu

set -xe
cd "$pkgmgr"
./build.sh
