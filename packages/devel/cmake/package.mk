# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="cmake"
PKG_VERSION="3.28.2"
PKG_SHA256="1466f872dc1c226f373cf8fba4230ed216a8f108bd54b477b5ccdfd9ea2d124a"
PKG_LICENSE="BSD"
PKG_SITE="https://cmake.org/"
PKG_URL="https://cmake.org/files/v$(get_pkg_version_maj_min)/cmake-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_HOST="pkg-config:host"
PKG_LONGDESC="A cross-platform, open-source make system."
PKG_TOOLCHAIN="configure"
PKG_BUILD_FLAGS="+local-cc"

configure_host() {
  ../configure --prefix=${TOOLCHAIN} \
               --no-qt-gui --no-system-libs \
               -- \
               -DCMAKE_C_FLAGS="-O2 -Wall -pipe -Wno-format-security" \
               -DCMAKE_CXX_FLAGS="-O2 -Wall -pipe -Wno-format-security" \
               -DCMAKE_EXE_LINKER_FLAGS="${HOST_LDFLAGS}" \
               -DCMAKE_USE_OPENSSL=OFF \
               -DBUILD_CursesDialog=0
}
