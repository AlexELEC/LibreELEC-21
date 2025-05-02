# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2011-present Alex@ELEC (https://alexelec.tv)

PKG_NAME="six"
PKG_VERSION="1.16.0"
PKG_SHA256="1e61c37477a1626458e36f7b1d82aa5c9b094fa4802892072e49de9c60c4c926"
PKG_LICENSE="BSD"
PKG_SITE="http://pypi.python.org/pypi/six/"
PKG_URL="https://pypi.io/packages/source/s/six/six-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python3 distutilscross:host"
PKG_LONGDESC="Python 2 and 3 compatibility utilities."
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
