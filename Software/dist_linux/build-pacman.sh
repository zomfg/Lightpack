#!/bin/sh


# TODO: better way of dynamically adding build-vars deps?
PULSEAUDIO_SUPPORT=
cd ..
qmake -r
if [ "$(grep -Fo PULSEAUDIO_SUPPORT src/Makefile)" == "PULSEAUDIO_SUPPORT" ]
then
    echo PULSEAUDIO_SUPPORT
    PULSEAUDIO_SUPPORT="'libpulse' 'fftw'"
fi
cd -

sed 's#__PULSEAUDIO_SUPPORT__#'"$PULSEAUDIO_SUPPORT"'#' PKGBUILD.template > PKGBUILD
makepkg -cf
rm PKGBUILD