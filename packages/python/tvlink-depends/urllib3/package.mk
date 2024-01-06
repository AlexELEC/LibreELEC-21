# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2011-present Alex@ELEC (https://alexelec.tv)

PKG_NAME="urllib3"
PKG_VERSION="1.26.18"
PKG_SHA256="16e6b13fdcb0949ad02f9ff453167b472af9911c420d5d6abfd3bdd11929e505"
PKG_LICENSE="Apache"
PKG_SITE="https://github.com/urllib3/urllib3"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python3 distutilscross:host"
PKG_LONGDESC="HTTP library with thread-safe connection pooling and file post support."
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
