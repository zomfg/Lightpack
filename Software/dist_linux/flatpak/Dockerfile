ARG OS=archlinux
ARG RELEASE=latest
FROM $OS:$RELEASE
RUN pacman -Syu --noconfirm && pacman -S --noconfirm \
    lsb-release \
    flatpak \
    flatpak-builder \
    && (yes | pacman -Scc) \
    && rm -rf /etc/localtime

VOLUME ["/Lightpack", "/build.sh", "/etc/localtime"]

ENTRYPOINT /build.sh
