# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libretro-dinothawr"
PKG_VERSION="e57e780a963372b89736620d7e3b8608190f7581"
PKG_SHA256="e969f14628a0b7c49609bc98b5ddf6344b3fa4ad3389de77f59da2d2b6160480"
PKG_LICENSE="CC-BY-NC-SA-3.0"
PKG_SITE="https://github.com/libretro/Dinothawr"
PKG_URL="https://github.com/libretro/Dinothawr/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Dinothawr is a block pushing puzzle game on slippery surfaces"
PKG_TOOLCHAIN="make"

PKG_LIBNAME="dinothawr_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"
PKG_LIBVAR="DINOTHAWR_LIB"

if target_has_feature neon; then
  PKG_MAKE_OPTS_TARGET="HAVE_NEON=1"
fi

makeinstall_target() {
  mkdir -p ${SYSROOT_PREFIX}/usr/lib/cmake/${PKG_NAME}
  cp ${PKG_LIBPATH} ${SYSROOT_PREFIX}/usr/lib/${PKG_LIBNAME}
  echo "set(${PKG_LIBVAR} ${SYSROOT_PREFIX}/usr/lib/${PKG_LIBNAME})" > ${SYSROOT_PREFIX}/usr/lib/cmake/${PKG_NAME}/${PKG_NAME}-config.cmake

  mkdir -p ${SYSROOT_PREFIX}/usr/share/retroarch/system
  cp -rv dinothawr ${SYSROOT_PREFIX}/usr/share/retroarch/system/dinothawr
}
