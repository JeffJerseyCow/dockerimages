FROM jeffjerseycow/llvm:8.0
WORKDIR /tools
ENV LC_CTYPE C.UTF-8
RUN apt-get update && \
    apt-get install sudo gdb cgdb python3 python3-pip git -y && \
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
    pip3 install bindings/python/
WORKDIR /entry
COPY run.sh ./run.sh
WORKDIR /debug
ENTRYPOINT ["/entry/run.sh"]    
