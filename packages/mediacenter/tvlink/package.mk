# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2011-present Alex@ELEC (https://alexelec.tv)

PKG_NAME="tvlink"
PKG_VERSION="latest"
PKG_LICENSE="GPL"
PKG_SITE="https://alexelec.tv"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain setuptools"
PKG_LONGDESC="TVLINK: IPTV streamer/aggregator."
PKG_TOOLCHAIN="manual"

# Streamlink depends
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET requests pycountry isodate lxml"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET websocket-client PySocks six pycryptodome"

make_target() {
  : # nothing to make here
}

makeinstall_target() {
  : # nothing to install here
}

post_install() {
  enable_service tvlink.service
}
