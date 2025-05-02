# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="MuMuDVB"
PKG_VERSION="5e9959e"
PKG_SHA256="aceb6cfb543bb2fa09e38f96089e80ff9eb74274780709d0dcf487a73db7d9d9"
PKG_LICENSE="GPL"
PKG_SITE="http://mumudvb.net/"
PKG_URL="https://github.com/braice/$PKG_NAME/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libdvbcsa"
PKG_LONGDESC="MuMuDVB (Multi Multicast DVB) is a program that streams from DVB on a network using multicasting or unicast"
PKG_TOOLCHAIN="autotools"
PKG_BUILD_FLAGS="-sysroot"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr \
                           --sysconfdir=/storage/.config/mumudvb \
                           --disable-arib-support"

post_makeinstall_target() {
  mkdir -p $INSTALL/usr/config/mumudvb/examples
    cp -a $PKG_BUILD/doc/configuration_examples/* $INSTALL/usr/config/mumudvb/examples
    cp -a $PKG_DIR/config/* $INSTALL/usr/config/mumudvb
}
