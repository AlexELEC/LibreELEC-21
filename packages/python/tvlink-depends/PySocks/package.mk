# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2011-present Alex@ELEC (https://alexelec.tv)

PKG_NAME="PySocks"
PKG_VERSION="c2fa43c"
PKG_SHA256="3d5aaa88b75320f142979f443c7eb20efb34da9e3e553e6c2bbae74812033732"
PKG_LICENSE="BSD"
PKG_SITE="https://github.com/Anorov/PySocks"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python3 distutilscross:host"
PKG_LONGDESC="SOCKS4, SOCKS5 or HTTP proxy (Anorov fork PySocks replaces socksipy)."
PKG_TOOLCHAIN="manual"

pre_configure_target() {
  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
}

make_target() {
  python3 setup.py build --cross-compile
}

makeinstall_target() {
  python3 setup.py install --root=$INSTALL --prefix=/usr
}

post_makeinstall_target() {
  python_remove_source
}
