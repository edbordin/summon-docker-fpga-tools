FROM ubuntu:xenial

# COPY summon-fpga-tools.sh ./

RUN apt-get update && apt-get install -y --no-install-recommends git mercurial build-essential bison clang cmake \
                     flex gawk graphviz xdot libboost-all-dev \
                     libeigen3-dev libffi-dev libftdi-dev libgmp3-dev \
                     libmpfr-dev libncurses5-dev libmpc-dev \
                     libreadline-dev zlib1g-dev pkg-config python \
                     python3 python3-dev tcl-dev autoconf gperf \
                     qtbase5-dev libqt5opengl5-dev ca-certificates

RUN git clone https://github.com/edbordin/summon-fpga-tools.git
WORKDIR summon-fpga-tools

RUN bash ICESTORM_EN=0 PRJTRELLIS_EN=0 ARACHNEPNR_EN=0 NEXTPNR_ICE40_EN=0 NEXTPNR_ECP5_EN=0 YOSYS_EN=0 summon-fpga-tools.sh
ENV PATH "/root/sft/bin:$PATH"