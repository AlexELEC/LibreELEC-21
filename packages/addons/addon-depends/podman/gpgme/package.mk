# SPDX-License-Identifier: GPL-2.0-only
# Copyright (C) 2023-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="gpgme"
PKG_VERSION="1.23.2"
PKG_SHA256="9499e8b1f33cccb6815527a1bc16049d35a6198a6c5fae0185f2bd561bce5224"
PKG_LICENSE="gpgme"
PKG_SITE="https://gnupg.org/software/gpgme/index.html"
PKG_URL="https://gnupg.org/ftp/gcrypt/gpgme/gpgme-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libassuan libgpg-error"
PKG_LONGDESC="GnuPG Made Easy (GPGME) is a library designed to make access to GnuPG easier for applications"
PKG_TOOLCHAIN="autotools"
PKG_BUILD_FLAGS="-sysroot"

PKG_CONFIGURE_OPTS_TARGET="--enable-languages=cl \
                           --disable-static \
                           --enable-shared \
                           --disable-glibtest \
                           --disable-gpgconf-test \
                           --disable-gpg-test \
                           --disable-gpgsm-test \
                           --disable-g13-test \
                           --with-pic \
                           --with-libgpg-error-prefix=${SYSROOT_PREFIX}/usr \
                           --with-libassuan-prefix=$(get_install_dir libassuan)/usr"

pre_configure_target() {
  CFLAGS="${CFLAGS} -I$(get_install_dir libassuan)/usr/include"
  LDFLAGS="${LDFLAGS} -L$(get_install_dir libassuan)/usr/lib"
}
