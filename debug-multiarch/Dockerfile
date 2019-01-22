FROM debian:9-slim
WORKDIR /build
ENV LC_CTYPE C.UTF-8
RUN apt-get update && \
    apt-get install build-essential flex bison git python autotools-dev libpixman-1-dev libglib2.0-dev pkg-config vim python3 python3-pip -y && \
    git clone https://github.com/JeffJerseyCow/qemu2drcov.git && \
    git clone https://github.com/qemu/qemu.git && \
    cd qemu && \
    git apply /build/qemu2drcov/patch/qemu.diff && \
    ./configure && \
    make -j $(nproc) && \
    make install && \
    cd /build/qemu2drcov && \
    pip3 install . --upgrade && \
    rm -rf /build/* && \
    apt-get purge flex bison git python autotools-dev libpixman-1-dev libglib2.0-dev pkg-config build-essential libglib2.0-dev libpixman-1-dev -y  && \
    apt-get autoremove -y
ENTRYPOINT ["bash"]
