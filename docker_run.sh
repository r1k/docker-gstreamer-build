#!/bin/bash

docker run -v `pwd`/ubuntu_src:/home/ubuntu/src -it r1k/gstreamer-build:v1 /bin/bash
