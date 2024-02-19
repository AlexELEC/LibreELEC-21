# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="gpiozero"
PKG_VERSION="2.0.1"
PKG_SHA256="d4ea1952689ec7e331f9d4ebc9adb15f1d01c2c9dcfabb72e752c9869ab7e97e"
PKG_ARCH="arm aarch64"
PKG_LICENSE="BSD"
PKG_SITE="https://github.com/RPi-Distro/python-gpiozero"
PKG_URL="https://files.pythonhosted.org/packages/source/${PKG_NAME:0:1}/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain colorzero"
PKG_LONGDESC="A simple interface to everyday GPIO components used with Raspberry Pi."
PKG_TOOLCHAIN="manual"
