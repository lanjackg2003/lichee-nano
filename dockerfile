FROM ubuntu:16.04
MAINTAINER jack <lanjackg2003@qq.com>
RUN apt-get update
RUN apt install -y wget tar git build-essential libncurses5-dev python swig python-dev bc libusb-1.0-0-dev pkg-config libssl-dev libc6-i386 lib32stdc++6 lib32z1 cpio unzip mtd-utils vim module-init-tools
RUN apt-get install squashfs-tools -y
RUN mkdir -p /opt/lichee && \
mkdir -p /opt/build && \
cd /opt/build && \
wget http://www.zlib.net/zlib-1.2.11.tar.xz && \
wget http://releases.linaro.org/components/toolchain/binaries/7.2-2017.11/arm-linux-gnueabi/gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabi.tar.xz && \
git clone -b f1c100s-spiflash https://github.com/Icenowy/sunxi-tools.git 
RUN cd /opt/build && \
tar -vxJf gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabi.tar.xz  && \
tar -vxJf zlib-1.2.11.tar.xz  && \
mv ./gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabi ../gcc && \
cd /opt/build/zlib-1.2.11 && \
chmod +x ./configure && \
./configure && \
make && \
make install && \
cd /opt/build/sunxi-tools && chmod +x ./*.sh && make && make install && \
cd .. && \
rm -rf /opt/build
WORKDIR /opt/lichee
ENV PATH $PATH:/root/.local/bin
ENV PATH $PATH:/opt/gcc/bin
CMD ["/bin/bash"]
