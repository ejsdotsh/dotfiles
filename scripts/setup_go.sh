#!/bin/bash

if [ $(id -u) -ne 0 ]
then
    echo "you must be root"
    exit 1
fi


GOLANG_VERSION=1.16.2
GOLANG_DOWNLOAD_URL=https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz
GOLANG_DOWNLOAD_SHA256=542e936b19542e62679766194364f45141fde55169db2d8d01046555ca9eb4b8

apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    g++ \
    gcc \
    libc6-dev \
    make \
    git

curl -fsSL "$GOLANG_DOWNLOAD_URL" -o golang.tar.gz \
  && echo "$GOLANG_DOWNLOAD_SHA256  golang.tar.gz" | sha256sum -c - \
  && tar -C /usr/local -xzf golang.tar.gz \
  && rm golang.tar.gz

for bin in $(ls /usr/local/go/bin/)
do
    if [ -f /usr/bin/$bin ]
    then
        rm /usr/bin/$bin
    fi
    update-alternatives --install /usr/bin/$bin $bin /usr/local/go/bin/$bin 1
    update-alternatives --set $bin /usr/local/go/bin/$bin
done

# cleanup
apt-get autoremove -y --purge
