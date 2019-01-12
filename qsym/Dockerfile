FROM ubuntu:16.04
WORKDIR /build
ENV INITIALUSER qsym
ENV INITIALDIR /qsym
RUN apt-get update && \
    apt-get install sudo git build-essential libc6 libstdc++6 linux-libc-dev gcc-multilib llvm-dev g++ g++-multilib python python-pip lsb-release -y && \
    git clone https://github.com/mcarpenter/afl.git && \
    cd afl && \
    make && \
    make install && \
    cd .. && \
    git clone https://github.com/sslab-gatech/qsym.git && \
    cd qsym && \
    ./setup.sh && \
    pip install .
WORKDIR /entry
COPY run.sh ./run.sh
WORKDIR /qsym
ENTRYPOINT ["/entry/run.sh"]
