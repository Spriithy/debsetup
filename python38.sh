#!/usr/bin/env bash

[[ "${UID}" -eq 0 ]] || exec sudo -i bash

sudo apt update
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev liblzma-dev -y

pushd /tmp

PYTHON_VERSION=3.8.10

curl -ksSl -O https://www.python.org/ftp/python/3.8.10/Python-${PYTHON_VERSION}.tar.xz

tar -xf Python-${PYTHON_VERSION}.tar.xz
cd Python-${PYTHON_VERSION}
./configure --enable-optimizations
make -j $(nproc)
sudo make altinstall

popd
