FROM ubuntu:18.04 as builder
WORKDIR /build
RUN apt-get update && \
    apt-get install build-essential flex bison git python autotools-dev libpixman-1-dev libglib2.0-dev pkg-config -y && \
    git clone https://github.com/JeffJerseyCow/qemu2drcov.git && \
    git clone https://github.com/qemu/qemu.git && \
    cd qemu && \
    git apply /build/qemu2drcov/patch/qemu.diff && \
    ./configure && \
    make -j $(nproc)
FROM ubuntu:18.04
WORKDIR /build
ENV LC_CTYPE C.UTF-8
ENV INITIALUSER debug
ENV INITIALDIR /debug
COPY --from=builder /build /build
RUN apt-get update && \
    apt-get install sudo gdb-multiarch git vim build-essential libglib2.0-dev libpixman-1-dev python3 python3-pip -y
RUN cd qemu/ && \
    make install && \
    git clone https://github.com/JeffJerseyCow/qemu2drcov.git && \
    cd qemu2drcov && \
    pip3 install . --upgrade && \
    rm -rf /build/*
WORKDIR /tools
RUN git clone https://github.com/electricworry/gef.git
WORKDIR /entry
COPY run.sh ./run.sh
COPY ppcinit ./ppcinit
WORKDIR /usr/bin
COPY gdb-ppc ./gdb-ppc
WORKDIR /debug
ENTRYPOINT ["/entry/run.sh"]

