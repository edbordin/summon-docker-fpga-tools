FROM ubuntu:xenial

RUN git clone https://github.com/esden/summon-fpga-tools.git
WORKDIR summon-fpga-tools
RUN bash summon-fpga-tools.sh
ENV PATH "/root/sft/bin:$PATH"