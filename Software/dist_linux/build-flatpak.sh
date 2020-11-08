#!/bin/sh -xe
distdir=Software/dist_linux
destdir=/tmp
rm -rf "$destdir/flatdir" "$destdir/repo"
flatpak install --user --assumeyes org.kde.Sdk//5.15 org.kde.Platform//5.15
flatpak-builder --delete-build-dirs --repo="$destdir/repo" "$destdir/flatdir" "$distdir/de.psieg.Prismatik.yml"
# flatpak-builder --user --install "$destdir/flatinstall" "$distdir/de.psieg.Prismatik.yml"
# flatpak run de.psieg.Prismatik
# flatpak build-export "$destdir/repo" "$destdir/flatdir"
flatpak build-bundle "$destdir/repo" prismatik.flatpak de.psieg.Prismatik
