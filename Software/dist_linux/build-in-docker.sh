#!/bin/sh

[ -z $1 ] && echo "./Usage $0 (dpkg|pacman|flatpak) os-image-name os-image-tag" && exit 1

pkgmgr=dpkg
[ ! -z $1 ] && pkgmgr=$1

os=ubuntu
[ ! -z $2 ] && os=$2

version=20.04
[ ! -z $3 ] && version=$3



echo $pkgmgr $os $version

[ ! -e  "$pkgmgr/Dockerfile" ] && echo "./$pkgmgr/Dockerfile not found" && exit 1

# exit 0
set -xe
docker build \
	--build-arg OS=$os \
	--build-arg RELEASE=$version \
	-f "./$pkgmgr/Dockerfile" \
	-t "prismatik/$os:$version" "./$pkgmgr"

indockerbuild=/tmp/build.sh

cat << EOF > "$indockerbuild"
#!/bin/sh
set -xe

lsb_release -a
qmake -v
gcc -v
lscpu
cd /Lightpack/Software/dist_linux/$pkgmgr
./build.sh
EOF
chmod +x "$indockerbuild"

docker run \
	-v "$(pwd)/../..:/Lightpack" \
	-v "$indockerbuild:/build.sh" \
	-v "/etc/localtime:/etc/localtime:ro" \
	--user="$(id -u):$(id -g)" \
	--rm \
	--name "builder" "prismatik/$os:$version"
