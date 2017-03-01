FROM ubuntu:16.04
    
RUN apt-get update && \
    apt-get install -y \
    python python-software-properties python-setuptools \
    git git-core wget \
    vim htop sudo \
    apt-utils dpkg-dev openssh-server software-properties-common \
    autoconf autopoint libtool bison flex gtk-doc-tools \
    libglib2.0-dev freeglut3 freeglut3-dev yasm libreadline-dev \
    libgvc6 graphviz-dev

RUN apt-add-repository -y "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) multiverse"

RUN apt-get update && apt-get install -y faac yasm

RUN addgroup --system ubuntu
RUN adduser --system --shell /bin/bash --gecos 'ubuntu' \
  --uid 1000 --disabled-password --home /home/ubuntu ubuntu
RUN adduser ubuntu sudo
RUN echo ubuntu:ubuntu | chpasswd
RUN echo "ubuntu ALL=NOPASSWD:ALL" >> /etc/sudoers
USER ubuntu
ENV HOME /home/ubuntu

RUN mkdir -p /home/ubuntu/src
VOLUME ["/home/ubuntu/src"]

WORKDIR /home/ubuntu/src

# Git config is needed so that cerbero can cleanly fetch some git repos
RUN git config --global user.email "you@example.com"
RUN git config --global user.name "Your Name"

RUN echo "alias cerbero='/home/ubuntu/src/cerbero/cerbero-uninstalled'" >> ~/.bashrc
