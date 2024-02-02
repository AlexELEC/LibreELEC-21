# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="alsa-utils"
PKG_VERSION="1.2.11"
PKG_SHA256="9ac6ca3a883f151e568dcf979b8d2e5cbecc51b819bb0e6bb8a2e9b34cc428a7"
PKG_LICENSE="GPL"
PKG_SITE="https://www.alsa-project.org/"
PKG_URL="https://www.alsa-project.org/files/pub/utils/alsa-utils-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain alsa-lib ncurses systemd"
PKG_LONGDESC="This package includes the utilities for ALSA, like alsamixer, aplay, arecord, alsactl, iecset and speaker-test."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--disable-alsaconf \
                           --disable-alsaloop \
                           --enable-alsatest \
                           --disable-bat \
                           --disable-dependency-tracking \
                           --disable-nls \
                           --disable-rst2man \
                           --disable-xmlto"

post_configure_target() {
  libtool_remove_rpath libtool
}

post_makeinstall_target() {
  rm -rf ${INSTALL}/lib ${INSTALL}/var
  rm -rf ${INSTALL}/usr/share/alsa/speaker-test
  rm -rf ${INSTALL}/usr/share/sounds
  rm -rf ${INSTALL}/usr/lib/systemd/system

# remove default udev rule to restore mixer configs, we install our own.
# so we avoid resetting our soundconfig
  rm -rf ${INSTALL}/usr/lib/udev/rules.d/90-alsa-restore.rules

  mkdir -p ${INSTALL}/.noinstall
  for i in aconnect alsamixer amidi aplaymidi arecord arecordmidi aseqdump aseqnet iecset; do
    mv ${INSTALL}/usr/bin/${i} ${INSTALL}/.noinstall
  done

  mkdir -p ${INSTALL}/usr/lib/udev
    cp ${PKG_DIR}/scripts/soundconfig ${INSTALL}/usr/lib/udev
}
