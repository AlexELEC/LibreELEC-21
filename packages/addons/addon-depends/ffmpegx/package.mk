# SPDX-License-Identifier: GPL-2.0-only
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="ffmpegx"
PKG_VERSION="6.0.1"
PKG_SHA256="9b16b8731d78e596b4be0d720428ca42df642bb2d78342881ff7f5bc29fc9623"
PKG_LICENSE="GPL-3.0-only"
PKG_SITE="https://ffmpeg.org"
PKG_URL="https://ffmpeg.org/releases/ffmpeg-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain aom bzip2 openssl lame libvorbis libxml2 opus x264 zlib"
PKG_LONGDESC="FFmpegx is an complete FFmpeg build to support encoding and decoding."
PKG_BUILD_FLAGS="-sysroot"

# Dependencies
get_graphicdrivers

if [ "${TARGET_ARCH}" = "x86_64" ]; then
  PKG_DEPENDS_TARGET+=" nasm:host x265"

  if listcontains "${GRAPHIC_DRIVERS}" "(crocus|i915|iris)"; then
    PKG_DEPENDS_TARGET+=" intel-vaapi-driver"
  fi
fi

if [[ ! ${TARGET_ARCH} = arm ]] || target_has_feature neon; then
  PKG_DEPENDS_TARGET+=" libvpx"
fi

# X11 grab for screen recording
if [ "${DISPLAYSERVER}" = "x11" ]; then
  PKG_DEPENDS_TARGET+=" libxcb libX11"
fi

pre_configure_target() {
  cd ${PKG_BUILD}
  rm -rf .${TARGET_NAME}

# HW encoders

  # Generic
  if [[ "${TARGET_ARCH}" = "x86_64" ]]; then
    PKG_FFMPEG_HW_ENCODERS_GENERIC="\
    `#Video encoders` \
    --enable-encoder=h264_vaapi \
    --enable-encoder=hevc_vaapi \
    --enable-encoder=mjpeg_vaapi \
    --enable-encoder=mpeg2_vaapi \
    --enable-encoder=vp8_vaapi \
    --enable-encoder=vp9_vaapi \
    --disable-encoder=h264_nvenc \
    --disable-encoder=hevc_nvenc \
    \
    `#Video hwaccel` \
    --enable-hwaccel=h263_vaapi \
    --enable-hwaccel=h264_vaapi \
    --enable-hwaccel=hevc_vaapi \
    --enable-hwaccel=mjpeg_vaapi \
    --enable-hwaccel=mpeg2_vaapi \
    --enable-hwaccel=mpeg4_vaapi \
    --enable-hwaccel=vc1_vaapi \
    --enable-hwaccel=vp8_vaapi \
    --enable-hwaccel=vp9_vaapi \
    --enable-hwaccel=wmv3_vaapi"

    PKG_FFMPEG_X26x_GENERIC="\
    --enable-libx264 \
    --enable-encoder=libx264 \
    --enable-libx265 \
    --enable-encoder=libx265"
  fi

# Encoders
    PKG_FFMPEG_ENCODERS="\
    `#Video encoders` \
    --enable-libvpx \
    --enable-encoder=libvpx_vp8 \
    --enable-encoder=libvpx_vp9 \
    ${PKG_FFMPEG_X26x_GENERIC} \
    --enable-libaom \
    --enable-encoder=libaom_av1 \
    \
    `#Audio encoders` \
    --enable-encoder=aac \
    --enable-encoder=ac3 \
    --enable-encoder=eac3 \
    --enable-encoder=flac \
    --enable-libmp3lame \
    --enable-encoder=libmp3lame \
    --enable-libopus \
    --enable-encoder=libopus \
    --enable-libvorbis \
    --enable-encoder=libvorbis"

# X11 grab for screen recording
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_FFMPEG_LIBS+=" -lX11"
    PKG_FFMPEG_X11_GRAB="\
    --enable-libxcb \
    --enable-libxcb-shm \
    --enable-libxcb-xfixes \
    --enable-libxcb-shape"
  else
    PKG_FFMPEG_X11_GRAB="\
    --disable-libxcb \
    --disable-libxcb-shm \
    --disable-libxcb-xfixes \
    --disable-libxcb-shape"
  fi
}

configure_target() {
  ./configure \
    \
    `#Programs to build` \
    --enable-ffmpeg \
    --disable-ffplay \
    --enable-ffprobe \
    \
    `#Static and Shared` \
    --enable-static \
    --pkg-config-flags="--static" \
    --disable-shared \
    \
    `#Licensing options` \
    --enable-gpl \
    --enable-version3 \
    \
    `#Documentation options` \
    --disable-doc \
    \
    `#Hardware accelerated decoding encoding` \
    ${PKG_FFMPEG_HW_ENCODERS_GENERIC} \
    \
    ${PKG_FFMPEG_ENCODERS} \
    \
    `#General options` \
    --disable-lzma \
    --disable-alsa \
    ${PKG_FFMPEG_X11_GRAB} \
    \
    `#Toolchain options` \
    --arch="${TARGET_ARCH}" \
    --cpu="${TARGET_CPU}" \
    --cross-prefix="${TARGET_PREFIX}" \
    --enable-cross-compile \
    --sysroot="${SYSROOT_PREFIX}" \
    --sysinclude="${SYSROOT_PREFIX}/usr/include" \
    --target-os="linux" \
    --nm="${NM}" \
    --ar="${AR}" \
    --as="${CC}" \
    --cc="${CC}" \
    --ld="${CC}" \
    --pkg-config="${TOOLCHAIN}/bin/pkg-config" \
    --host-cc="${HOST_CC}" \
    --host-cflags="${HOST_CFLAGS}" \
    --host-ldflags="${HOST_LDFLAGS}" \
    --host-extralibs="-lm" \
    --extra-cflags="${CFLAGS}" \
    --extra-ldflags="${LDFLAGS}" \
    --extra-libs="${PKG_FFMPEG_LIBS}" \
    --enable-pic \
    --disable-gnutls \
    --enable-openssl \
    --enable-libxml2 \
    \
    `#Advanced options` \
    --disable-hardcoded-tables \

}
