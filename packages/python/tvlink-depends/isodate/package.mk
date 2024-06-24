# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2011-present Alex@ELEC (https://alexelec.tv)

PKG_NAME="isodate"
PKG_VERSION="8856fdf"
PKG_SHA256="26182ef4e36959ed25c42e6f2eb541b53657343beb1ac00387ab59c2ff70bfd4"
PKG_LICENSE="BSD"
PKG_SITE="https://github.com/gweis/isodate"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python3 distutilscross:host"
PKG_LONGDESC="ISO 8601 date/time parser."
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
