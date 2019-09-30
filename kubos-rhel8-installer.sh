#!/bin/bash

dnf -y install epel-release
dnf -y install git
dnf -y install curl
# install rust/rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# add ~/.cargo/bin to your system's PATH
rustup default 1.32.0
rustup component add clippy
rustup component add rustfmt

dnf -y install gcc
dnf -y install pkg-config
dnf -y install openssl-devel.x86_64
dnf -y install sqlite libsqlite3-devel
#dnf -y install python3.7 python3-pip
pip3 install toml mock responses

# fetch the latest copy of the KubOS source repo
git clone https://github.com/kubos/kubos

# suggested to install the python app-api, which is used in developing Python-based apps
pushd kubos/apis/app-api/python && pip3 install . --user $$ popd

# suggested to install the python kubos-service library
pushd kubos/libs/kubos-service && pip3 install . --user && popd

# run the following script from the base of the kubos repo to verify everything is installed correctly and working
./kubos/tools/kubos_verify.sh