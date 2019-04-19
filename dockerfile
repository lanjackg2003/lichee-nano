FROM ubuntu:16.04
MAINTAINER jack <lanjackg2003@qq.com>
RUN apt-get update
RUN apt install wget -y
RUN apt install tar -y
RUN apt install screen -y
RUN apt install git  -y
RUN apt install build-essential -y
RUN apt-get install libncurses5-dev -y
RUN apt install python -y
RUN apt install swig -y
RUN apt install python-dev -y
RUN apt install bc -y
RUN apt install libusb-1.0-0-dev -y
RUN apt install pkg-config -y
RUN apt install libssl-dev -y
RUN mkdir -p /opt/lichee
copy ./gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabi/ /opt/gcc/
copy ./zlib-1.2.11/ /opt/zlib-1.2.11/
copy ./sunxi-tools/ /opt/sunxi-tools/
RUN cd /opt/zlib-1.2.11 && && \
./configure && \
make && \
make install && \
cd .. && \
rm -rf /opt/zlib-1.2.11 && \
cd /opt/sunxi-tools && make && make install && \
cd .. && \
rm -rf /opt/sunxi-tools
WORKDIR /opt/lichee
ENV PATH $PATH:/root/.local/bin
ENV PATH $PATH:/opt/gcc/bin
CMD ["/bin/bash"]
