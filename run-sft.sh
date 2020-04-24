#!/bin/bash

set -e

apt-get update && apt-get install -y --no-install-recommends git mercurial build-essential bison clang cmake \
                     flex gawk graphviz xdot libboost-all-dev \
                     libeigen3-dev libffi-dev libftdi-dev libgmp3-dev \
                     libmpfr-dev libncurses5-dev libmpc-dev \
                     libreadline-dev zlib1g-dev pkg-config python \
                     python3 python3-dev tcl-dev autoconf gperf \
                     qtbase5-dev libqt5opengl5-dev ca-certificates \
                     locales automake

locale-gen --no-purge en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US:en
export LC_ALL=en_US.UTF-8

mkdir -p ~/sft/bin
git clone https://github.com/universal-ctags/ctags.git
pushd ctags
autogen.sh
./configure --prefix=~/sft
make
make install
popd

git clone https://github.com/thomasrussellmurphy/istyle-verilog-formatter.git
pushd istyle-verilog-formatter
make
cp bin/release/iStyle ~/sft/bin
popd

git clone https://github.com/esden/summon-fpga-tools.git
pushd summon-fpga-tools
bash summon-fpga-tools.sh
popd

cd ~
tar -pcvzf symbiflow-nightly.tar.gz sft
