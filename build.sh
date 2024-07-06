set -ex

# sudo yum update
# sudo yum install bzip2 gnutls -y

cd $(dirname "$0")

clang-format -i opus_muxer.cpp

TYLIB_DIR=../tywebrtc/third_party/tylib
FFMPEG_DIR=../tywebrtc/third_party/ffmpeg
OPUS_DIR=../tywebrtc/third_party/opus
X264_DIR=../tywebrtc/third_party/x264
VPX_DIR=../tywebrtc/third_party/libvpx

# scl -l
# yum list all --enablerepo='centos-sclo-rh'
scl enable devtoolset-8 -- g++ -std=c++17 \
    -I $TYLIB_DIR \
    -I $FFMPEG_DIR \
    opus_muxer.cpp \
    $FFMPEG_DIR/libavformat/libavformat.a \
    $FFMPEG_DIR/libavcodec/libavcodec.a \
    $FFMPEG_DIR/libswresample/libswresample.a \
    $FFMPEG_DIR/libswscale/libswscale.a \
    $FFMPEG_DIR/libavutil/libavutil.a \
    $OPUS_DIR/.libs/libopus.a \
    $X264_DIR/libx264.a \
    $VPX_DIR/libvpx.a \
    -l dl -pthread -l z -l bz2 -l gnutls \
    -o opus_muxer
