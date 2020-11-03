#!/bin/sh
set -xe

os=ubuntu
[ ! -z $1 ] && os=$1

version=20.04
[ ! -z $2 ] && version=$2

pkgmgr=dpkg
[ ! -z $3 ] && pkgmgr=$3

echo $pkgmgr $os $version
set -xe
docker build \
	--build-arg OS=$os \
	--build-arg RELEASE=$version \
	-f Software/dist_linux/docker/Dockerfile.$pkgmgr \
	-t "prismatik/$os:$version" Software/dist_linux/docker
