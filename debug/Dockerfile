FROM jeffjerseycow/llvm:8.0
WORKDIR /tools
ENV LC_CTYPE C.UTF-8
ENV INITIALUSER debug
ENV INITIALDIR /debug
RUN apt-get update && \
    apt-get install sudo gdb python3 autotools-dev python3-pip git build-essential -y && \
    apt-get install automake libncurses5-dev flex texinfo libreadline-dev -y && \
    pip3 install unicorn capstone ropper && \
    mkdir /in && \
    git clone https://github.com/longld/peda.git && \
    git clone https://github.com/hugsy/gef.git && \
    git clone https://github.com/keystone-engine/keystone.git && \
    cd keystone && \
    mkdir build && \
    cd build && \
    ../make-share.sh && \
    make install && \
    cd .. && \
    echo "/usr/local/lib" >> /etc/ld.so.conf && \
    ldconfig && \
    pip3 install bindings/python/ && \
    cd /tools && \
    git clone https://github.com/cgdb/cgdb.git && \
    cd cgdb && \
    ./autogen.sh && \
    ./configure && \
    make -j $(nproc) && \
    make install && \
    rm -rf /tools/keystone /tools/cgdb
WORKDIR /entry
COPY run.sh ./run.sh
WORKDIR /debug
ENTRYPOINT ["/entry/run.sh"]    
