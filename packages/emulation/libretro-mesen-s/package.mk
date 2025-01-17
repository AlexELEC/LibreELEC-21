# SPDX-License-Identifier: GPL-2.0-only
# Copyright (C) 2023-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libretro-mesen-s"
PKG_VERSION="d4fca31a6004041d99b02199688f84c009c55967"
PKG_SHA256="f9a601bcb518bf750b5674bc3990675245fe3cfae6d824be8fb4bd61d13cecc4"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/Mesen-S"
PKG_URL="https://github.com/libretro/Mesen-S/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Mesen-S is a cross-platform (Windows & Linux) SNES emulator built in C++ and C#"
PKG_TOOLCHAIN="make"

PKG_LIBNAME="mesen-s_libretro.so"
PKG_LIBPATH="Libretro/${PKG_LIBNAME}"
PKG_LIBVAR="MESEN-S_LIB"

PKG_MAKE_OPTS_TARGET="-C Libretro/"

makeinstall_target() {
  mkdir -p ${SYSROOT_PREFIX}/usr/lib/cmake/${PKG_NAME}
  cp ${PKG_LIBPATH} ${SYSROOT_PREFIX}/usr/lib/${PKG_LIBNAME}
  echo "set(${PKG_LIBVAR} ${SYSROOT_PREFIX}/usr/lib/${PKG_LIBNAME})" > ${SYSROOT_PREFIX}/usr/lib/cmake/${PKG_NAME}/${PKG_NAME}-config.cmake
}
