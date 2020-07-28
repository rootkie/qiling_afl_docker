FROM ubuntu:19.10

# American Fuzzy Lop w/ qemu userland support

# afl-analyze  afl-clang  afl-clang++  afl-cmin  afl-fuzz  afl-g++  
# afl-gcc  afl-gotcpu  afl-plot  afl-showmap  afl-tmin  afl-whatsup
# afl-qemu-trace

RUN echo "deb-src http://archive.ubuntu.com/ubuntu eoan main restricted" >> /etc/apt/sources.list

ENV TZ=Singapore
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y update && \
    apt-get -y build-dep qemu && \
    apt install -y git python3-pip cmake wget curl build-essential libtool-bin python3-dev automake flex bison libglib2.0-dev libpixman-1-dev clang python3-setuptools llvm
    

RUN git clone https://github.com/qilingframework/qiling && \
    cd qiling && \
    pip3 install -r requirements.txt && \
    python3 setup.py install

RUN git clone https://github.com/AFLplusplus/AFLplusplus.git && \
    ( cd AFL* && make distrib; make install)
 
RUN apt install -y vim nano
