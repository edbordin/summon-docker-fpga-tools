FROM ubuntu:xenial

RUN apt-get update && apt-get install git mercurial build-essential bison clang cmake \
                     flex gawk graphviz xdot libboost-all-dev \
                     libeigen3-dev libffi-dev libftdi-dev libgmp3-dev \
                     libmpfr-dev libncurses5-dev libmpc-dev \
                     libreadline-dev zlib1g-dev pkg-config python \
                     python3 python3-dev tcl-dev autoconf gperf \
                     qtbase5-dev libqt5opengl5-dev

RUN git clone https://github.com/esden/summon-fpga-tools.git
WORKDIR summon-fpga-tools
RUN bash summon-fpga-tools.sh
ENV PATH "/root/sft/bin:$PATH"