#!/bin/bash

BUILD_DIR=`pwd`

git clone --depth 1 git://anongit.freedesktop.org/gstreamer/cerbero

sed -i 's/apt-get install/apt-get install -y/g' cerbero/cerbero/bootstrap/linux.py

#sed -i "/UBUNTU_XENIAL = 'ubuntu_xenial'/a \ \ \ \ UBUNTU_YAKKETY = 'ubuntu_yakkety'" cerbero/cerbero/enums.py

#sed -i "/distro_version = DistroVersion.UBUNTU_XENIAL/a \ \ \ \ \ \ \ \ \ \ \ \ elif d[2] in ['yakkety']:" cerbero/cerbero/utils/__init__.py
#sed -i "/\['yakkety'\]\:/a \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ distro_version = DistroVersion.UBUNTU_YAKKETY" cerbero/cerbero/utils/__init__.py

cd cerbero && ./cerbero-uninstalled bootstrap

#cerbero package gstreamer-1.0