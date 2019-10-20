FROM ubuntu:xenial

RUN apt-get update && apt-get install -y --no-install-recommends git mercurial build-essential bison clang cmake \
                     flex gawk graphviz xdot libboost-all-dev \
                     libeigen3-dev libffi-dev libftdi-dev libgmp3-dev \
                     libmpfr-dev libncurses5-dev libmpc-dev \
                     libreadline-dev zlib1g-dev pkg-config python \
                     python3 python3-dev tcl-dev autoconf gperf \
                     qtbase5-dev libqt5opengl5-dev ca-certificates \
                     locales automake

RUN locale-gen --no-purge en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN git clone https://github.com/universal-ctags/ctags.git && cd ctags && ./autogen.sh && ./configure --prefix=/usr && make && make install
RUN git clone https://github.com/thomasrussellmurphy/istyle-verilog-formatter.git && cd istyle-verilog-formatter && make && cp bin/release/iStyle /usr/bin

RUN git clone https://github.com/esden/summon-fpga-tools.git
WORKDIR summon-fpga-tools

RUN bash summon-fpga-tools.sh
ENV PATH "/root/sft/bin:$PATH"

