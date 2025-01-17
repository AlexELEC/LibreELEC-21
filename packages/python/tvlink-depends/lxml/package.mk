# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2011-present Alex@ELEC (https://alexelec.tv)

PKG_NAME="lxml"
PKG_VERSION="4.9.3"
PKG_SHA256="42b9ab83cb8739d817c7fff41c20f31aa61625bb6f6ab333873a5f3406b139ac"
PKG_LICENSE="BSD"
PKG_SITE="https://github.com/lxml/lxml"
PKG_URL="$PKG_SITE/archive/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python3 distutilscross:host cython:host libxslt:host libxml2 libxslt"
PKG_LONGDESC="The lxml XML toolkit for Python."
PKG_TOOLCHAIN="manual"

pre_configure_target() {
  cd $PKG_BUILD
  rm -rf .$TARGET_NAME

  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
  export LDSHARED="$CC -shared"
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
