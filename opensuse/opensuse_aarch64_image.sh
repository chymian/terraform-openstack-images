#!/usr/bin/env bash
IMAGE_CACHE=$HOME/.terraform/image_cache

if [ ! -d $IMAGE_CACHE ]; then
  mkdir -p $IMAGE_CACHE
fi

PROJECT_DIR=`pwd`

echo "Image Cache Location: "
echo $IMAGE_CACHE
echo
echo "Project Directory: "
echo $PROJECT_DIR
echo

cd $IMAGE_CACHE

if [ -e openSUSE-Leap-15.1-OpenStack.aarch64.qcow2 ]
then
  echo "openSUSE-Leap-15.1-OpenStack.aarch64.qcow2 image found.  Removing image."
  rm -rf openSUSE-Leap-15.1-OpenStack.aarch64.*
else
  echo "No previous OpenSuSE image found."
fi
wget https://download.opensuse.org/repositories/Cloud:/Images:/Leap_15.1/images/openSUSE-Leap-15.1-OpenStack.aarch64.qcow2 -O openSUSE-Leap-15.1-OpenStack.aarch64.qcow2
echo "Converting qcow image to raw"
qemu-img convert -f qcow2 -O raw openSUSE-Leap-15.1-OpenStack.aarch64.qcow2 openSUSE-Leap-15.1-OpenStack.aarch64.raw
cd $PROJECT_DIR
