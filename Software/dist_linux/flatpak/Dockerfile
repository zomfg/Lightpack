ARG OS=archlinux
ARG RELEASE=latest
FROM $OS:$RELEASE
RUN pacman -Syu --noconfirm && pacman -S --noconfirm \
    lsb-release \
    flatpak \
    flatpak-builder \
    && flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo \
    && (yes | pacman -Scc) \
    && rm -rf /etc/localtime

VOLUME ["/Lightpack", "/build.sh", "/etc/localtime"]

ENTRYPOINT /build.sh
