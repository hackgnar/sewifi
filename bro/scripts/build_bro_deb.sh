#!/bin/bash

BRO_SOURCE=~/source/bro

# required build dependancies
/bin/su -c "apt-get install -y curl build-essential cmake bison libpcap-dev zlib1g-dev flex python-dev swig libssl-dev file git"

# make directory structure
mkdir -p $BRO_SOURCE
cd $BRO_SOURCE

# download bro source
if [[ $1 && -f $1 ]]; then
    cp $1 .
else
    curl -O https://www.bro.org/downloads/release/bro-2.3.1.tar.gz
fi
tar xfz bro*.tar.gz

# configure bro package
cd $BRO_SOURCE/bro*/pkg
sed -i "s/\.\/check-cmake/#\.\/check-cmake/g" make-deb-packages
#should i make as root for file permissions to be set as root???
./make-deb-packages
