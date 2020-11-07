#!/bin/sh
set -xe

os=ubuntu
[ ! -z $1 ] && os=$1

version=20.04
[ ! -z $2 ] && version=$2

pkgmgr=dpkg
[ ! -z $3 ] && pkgmgr=$3

docker run \
	-v "$(pwd):/Lightpack" \
	-v "$(pwd)/Software/dist_linux/docker/build.$pkgmgr:/build.sh" \
	-v "/etc/localtime:/etc/localtime:ro" \
	--user="$(id -u):$(id -g)" \
	--rm \
	--name "builder" "prismatik/$os:$version"
