# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="screensaver.shadertoy"
PKG_VERSION="21.0.1-Omega"
PKG_SHA256="5a26f12916ea33b8daf7ea061dd0abf89315af805f3fb8b44d4ae3080ad367c4"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/xbmc/screensaver.shadertoy"
PKG_URL="https://github.com/xbmc/screensaver.shadertoy/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain kodi-platform glm"
PKG_SECTION=""
PKG_SHORTDESC="screensaver.shadertoy"
PKG_LONGDESC="screensaver.shadertoy"

PKG_IS_ADDON="yes"
PKG_ADDON_TYPE="xbmc.ui.screensaver"

if [ ! "${OPENGL}" = "no" ]; then
# for OpenGL (GLX) support
  PKG_DEPENDS_TARGET+=" ${OPENGL} glew"
fi

if [ "${OPENGLES_SUPPORT}" = yes ]; then
# for OpenGL-ES support
  PKG_DEPENDS_TARGET+=" ${OPENGLES}"
fi
