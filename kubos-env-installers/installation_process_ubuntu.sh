#!/bin/bash
# Author: Manuel Lindo
# Date: September 30th 2019
# Purpose: If you run this bash script it will download the development
# dependencies

sudo apt-get install git

sudo apt-get install curl

echo 'Follow the instruction given: '
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
export PATH=$PATH:/root/.cargo/bin

rustup default 1.32.0

rustup component add clippy

rustup component add rustfmt

sudo apt purge gcc
sudo apt-get autoremove
sudo apt update
sudo apt upgrade
sudo apt full-upgrade
sudo apt install gcc

sudo apt-get install pkg-config

# The Mac Users will need the openssl version
sudo apt-get install openssl
# If windows the libssl-dev will install
sudo apt-get install libssl-dev

sudo apt-get install sqlite3 
# For non Mac Users this will be necessary
sudo apt-get libsqlite3-dev

sudo apt-get install python3.7

sudo apt  install python3-pip

pip3 install toml mock responses

# Feteches the latest copy of the KubOS source repo and installs python for Python-based application
# and installs python libraries. After all of this, the script from  KubOs is run to make sure everything
# is absolutely Gucci
git clone https://github.com/kubos/kubos
pushd kubos/apis/app-api/python && pip3 install . --user && popd
pushd kubos/libs/kubos-service && pip3 install . --user && popd
./tools/kubos_verify.sh


 

