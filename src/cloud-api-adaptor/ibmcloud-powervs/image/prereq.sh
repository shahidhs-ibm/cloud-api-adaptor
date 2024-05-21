#!/bin/bash

GO_VERSION="1.21.10"
RUST_VERSION="1.72.0"
YQ_VERSION="v4.42.1"

# Install dependencies
yum install -y curl protobuf-compiler libseccomp-devel openssl openssl-devel perl skopeo clang clang-devel

#Install device-mapepr-devel
wget https://rpmfind.net/linux/centos/8-stream/PowerTools/ppc64le/os/Packages/device-mapper-devel-1.02.181-14.el8.ppc64le.rpm
yum install -y device-mapper-devel-1.02.181-14.el8.ppc64le.rpm

#Install yq
wget https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_ppc64le
chmod +x yq_linux_ppc64le && mv yq_linux_ppc64le /usr/local/bin/yq

# Install Golang
curl https://dl.google.com/go/go${GO_VERSION}.linux-ppc64le.tar.gz -o go${GO_VERSION}.linux-ppc64le.tar.gz && \
rm -rf /usr/local/go && tar -C /usr/local -xzf go${GO_VERSION}.linux-ppc64le.tar.gz && \
rm -f go${GO_VERSION}.linux-ppc64le.tar.gz

# Install Rust
curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain ${RUST_VERSION}
rustup target add powerpc64le-unknown-linux-gnu
