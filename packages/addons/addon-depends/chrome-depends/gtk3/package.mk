# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2017 Escalade
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="gtk3"
PKG_VERSION="3.24.41"
PKG_SHA256="47da61487af3087a94bc49296fd025ca0bc02f96ef06c556e7c8988bd651b6fa"
PKG_LICENSE="LGPL"
PKG_SITE="https://www.gtk.org/"
PKG_URL="https://ftp.gnome.org/pub/gnome/sources/gtk+/${PKG_VERSION:0:4}/gtk+-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain at-spi2-core atk cairo gdk-pixbuf glib libX11 libXi libXrandr libepoxy pango libxkbcommon"
PKG_DEPENDS_CONFIG="libXft pango gdk-pixbuf shared-mime-info"
PKG_LONGDESC="A library for creating graphical user interfaces for the X Window System."
PKG_BUILD_FLAGS="-sysroot"

PKG_MESON_OPTS_TARGET="-Dbroadway_backend=false \
                       -Dcloudproviders=false \
                       -Dcolord=no \
                       -Ddemos=false \
                       -Dexamples=false \
                       -Dgtk_doc=false \
                       -Dintrospection=false \
                       -Dman=false \
                       -Dprint_backends=file,lpr \
                       -Dquartz_backend=false \
                       -Dtests=false \
                       -Dwayland_backend=false \
                       -Dwin32_backend=false \
                       -Dxinerama=no \
                       -Dbuiltin_immodules=yes \
                       -Dx11_backend=true"

pre_configure_target() {
  # ${TOOLCHAIN}/bin/glib-compile-resources requires ${TOOLCHAIN}/lib/libffi.so.6
  export LD_LIBRARY_PATH="${TOOLCHAIN}/lib:${LD_LIBRARY_PATH}"
  export GLIB_COMPILE_RESOURCES=glib-compile-resources GLIB_MKENUMS=glib-mkenums GLIB_GENMARSHAL=glib-genmarshal
}
