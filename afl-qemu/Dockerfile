FROM ubuntu:16.04
WORKDIR /build
ENV INITIALUSER afl
ENV INITIALDIR /afl
COPY build_qemu_support.sh ./build_qemu_support.sh
RUN apt-get update && \
    apt-get install sudo git wget python automake bison libtool-bin build-essential libglib2.0-dev qemu gcc-powerpc-linux-gnu -y && \
    git clone https://github.com/mcarpenter/afl.git && \
    cd afl && \
    make && \
    make install && \
    cd qemu_mode && \
    rm build_qemu_support.sh && \
    cp /build/build_qemu_support.sh . && \
    ./build_qemu_support.sh && \
    cd .. && \
    make install && \
    rm -rf /build/*
WORKDIR /entry
COPY run.sh ./run.sh
WORKDIR /afl
ENTRYPOINT ["/entry/run.sh"]

