# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libusbmuxd"
PKG_VERSION="2.1.0"
PKG_SHA256="3bda6abb2167e7818bd449aa03c5cfe175c6f965bab3979fda6d58e698df19af"
PKG_LICENSE="GPL"
PKG_SITE="http://www.libimobiledevice.org"
PKG_URL="https://github.com/libimobiledevice/libusbmuxd/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain libimobiledevice-glue libplist"
PKG_LONGDESC="A USB multiplex daemon."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="ac_cv_func_malloc_0_nonnull=yes \
                           ac_cv_func_realloc_0_nonnull=yes \
                           --enable-static \
                           --disable-shared"

configure_package() {
  # if using a git hash as a package version - set RELEASE_VERSION
  export RELEASE_VERSION="$(sed -n '1,/RE/s/Version \(.*\)/\1/p' ${PKG_BUILD}/NEWS)-git-${PKG_VERSION:0:7}"
}

post_configure_target() {
  libtool_remove_rpath libtool
}
