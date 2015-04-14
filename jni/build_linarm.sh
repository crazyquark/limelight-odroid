#!/bin/sh

echo "Building Gamepad JNI"
(cd gamepad_jni && sh buildlinuxarm.sh)

echo "Building NV AVC Decoder"
(cd nv_avc_dec && sh buildlinuxarm.sh)

echo "Building NV OPUS Decoder"
(cd nv_opus_dec && sh buildlinuxarm.sh)

echo "Copying to libs/linarm/"

cp gamepad_jni/libgamepad_jni.so ../libs/linarm/
cp nv_avc_dec/libnv_avc_dec.so ../libs/linarm/
cp nv_opus_dec/libnv_opus_dec.so ../libs/linarm/
