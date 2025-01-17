# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libretro-picodrive"
PKG_VERSION="d96dd4cd76576a557c9e902b5f1e3f5f9dc22e3a"
PKG_SHA256="90db059f7b448a13f03a380519a7d4fec63a923d14430163c31958aeb9f1ec51"
PKG_LICENSE="MAME"
PKG_SITE="https://github.com/libretro/picodrive"
PKG_URL="https://github.com/kodi-game/picodrive/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain ${PKG_NAME}:host"
PKG_DEPENDS_HOST="toolchain:host"
PKG_LONGDESC="Libretro implementation of PicoDrive. (Sega Megadrive/Genesis/Sega Master System/Sega GameGear/Sega CD/32X)"
PKG_TOOLCHAIN="make"

PKG_LIBNAME="picodrive_libretro.so"
PKG_LIBPATH="../${PKG_LIBNAME}"
PKG_LIBVAR="PICODRIVE_LIB"

PKG_MAKE_OPTS_TARGET="-f Makefile.libretro -C ../"

make_host() {
  if [ "${ARCH}" != "x86_64" ]; then
    make -C ../cpu/cyclone CONFIG_FILE=../cyclone_config.h
  fi
}

makeinstall_host() {
  : # nothing to do
}

pre_make_target() {
  CFLAGS+=" -I./"
}

makeinstall_target() {
  mkdir -p ${SYSROOT_PREFIX}/usr/lib/cmake/${PKG_NAME}
  cp ${PKG_LIBPATH} ${SYSROOT_PREFIX}/usr/lib/${PKG_LIBNAME}
  echo "set(${PKG_LIBVAR} ${SYSROOT_PREFIX}/usr/lib/${PKG_LIBNAME})" > ${SYSROOT_PREFIX}/usr/lib/cmake/${PKG_NAME}/${PKG_NAME}-config.cmake
}
