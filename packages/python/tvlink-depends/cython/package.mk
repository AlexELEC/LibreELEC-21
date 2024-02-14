# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2011-present Alex@ELEC (http://alexelec.in.ua)

PKG_NAME="cython"
PKG_VERSION="0.29.36"
PKG_SHA256="bd8ee4208e1f2817914894eca8c4ca894f6c9a51803b0b815a9a3c03d01ab729"
PKG_LICENSE="Apache-2.0"
PKG_SITE="http://cython.org/"
PKG_URL="https://github.com/cython/cython/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="Python3:host setuptools:host"
PKG_LONGDESC="Cython is a language specially designed for writing Python extension modules."
PKG_TOOLCHAIN="manual"

makeinstall_host() {
  exec_thread_safe python3 setup.py install --prefix=$TOOLCHAIN
}
