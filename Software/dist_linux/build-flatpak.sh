#!/bin/sh -xe
kde_version=5.15
flatpak_id=de.psieg.Prismatik
destdir=/tmp
VERSION=`cat ../VERSION`

[ ! -e "$flatpak_id.yml" ] && echo "manifest $flatpak_id.yml not found" && exit 1

rm -rf "$destdir/flatdir" "$destdir/repo"
flatpak install --user --assumeyes org.kde.Sdk//"$kde_version" org.kde.Platform//"$kde_version"
flatpak-builder --delete-build-dirs --repo="$destdir/repo" "$destdir/flatdir" "$flatpak_id.yml"
# flatpak build-export "$destdir/repo" "$destdir/flatdir"
flatpak build-bundle "$destdir/repo" "prismatik_$VERSION.flatpak" "$flatpak_id"
# flatpak run de.psieg.Prismatik
