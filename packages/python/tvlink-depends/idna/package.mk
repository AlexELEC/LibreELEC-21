# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2011-present Alex@ELEC (https://alexelec.tv)

PKG_NAME="idna"
PKG_VERSION="3.4"
PKG_SHA256="afbfa0caebd4872b38ab1af86b37bd4f46d4fccc8d5ce226cb9ee91b91196848"
PKG_LICENSE="BSD"
PKG_SITE="https://github.com/kjd/idna"
PKG_URL="$PKG_SITE/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python3 distutilscross:host"
PKG_LONGDESC="Internationalized Domain Names in Applications (IDNA)."
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
