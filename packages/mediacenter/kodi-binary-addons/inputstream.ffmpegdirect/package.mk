# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2020-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="inputstream.ffmpegdirect"
PKG_VERSION="21.2.0-Omega"
PKG_SHA256="96235dfd5e3ae606510ccaf69d1aa74b4b2641d01fbd5efa4546fcd948dc1847"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL2+"
PKG_SITE="https://github.com/xbmc/inputstream.ffmpegdirect"
PKG_URL="https://github.com/xbmc/inputstream.ffmpegdirect/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain kodi-platform bzip2 ffmpeg gmp libpng libxml2 xz zlib zvbi"
PKG_SECTION=""
PKG_SHORTDESC="inputstream.ffmpegdirect"
PKG_LONGDESC="InputStream Client for streams that can be opened by FFmpeg's libavformat such as plain TS, HLS and DASH (without DRM) streams."

PKG_IS_ADDON="yes"

post_patch() {
  # set version
  find ${PKG_BUILD} -name addon.xml.in -exec sed -i 's/version="21.2.0"/version="21.2.0.9"/g' {} \;
}
