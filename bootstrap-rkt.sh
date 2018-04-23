#!/bin/bash

# Bootstrap script to run a customized Vagrant box for demoing rkt.

sudo apt-get update

# Download and install rkt
gpg --recv-key 18AD5014C99EF7E3BA5F6CE950BDD3E0FC8A365E
wget https://github.com/rkt/rkt/releases/download/v1.29.0/rkt_1.29.0-1_amd64.deb
wget https://github.com/rkt/rkt/releases/download/v1.29.0/rkt_1.29.0-1_amd64.deb.asc
gpg --verify rkt_1.29.0-1_amd64.deb.asc
sudo dpkg -i rkt_1.29.0-1_amd64.deb

# Download the systemd-container package
sudo apt-get systemd-container

# Download acbuild
git clone https://github.com/containers/build acbuild
cd ./acbuild && ./build
cp ./acbuild/bin/acbuild /usr/bin
