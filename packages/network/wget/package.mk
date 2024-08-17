# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2011-present Alex@ELEC (http://alexelec.in.ua)

PKG_NAME="wget"
PKG_VERSION="1.24.5"
PKG_SHA256="fa2dc35bab5184ecbc46a9ef83def2aaaa3f4c9f3c97d4bd19dcb07d4da637de"
PKG_LICENSE="GPL"
PKG_SITE="https://www.gnu.org/software/wget/"
PKG_URL="http://ftp.gnu.org/gnu/wget/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain openssl pcre2"
PKG_LONGDESC="wget: A non-interactive network retriever"
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--disable-nls \
                           --disable-rpath \
                           --with-gnu-ld \
                           --with-ssl=openssl \
                           --with-openssl=yes"

post_makeinstall_target() {
  rm -rf $INSTALL/etc
}
