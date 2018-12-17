FROM jeffjerseycow/llvm:7.0
WORKDIR /ikos
RUN apt-get update && \
    apt-get install sudo git libboost-all-dev libgmp-dev doxygen libsqlite3-dev -y && \
    git clone https://github.com/NASA-SW-VnV/ikos.git && \
    cd ikos && \
    mkdir /opt/ikos -p && \
    mkdir build && \
    cd build && \
    CFLAGS=-fno-rtti CXXFLAGS=-fno-rtti cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local/ .. && \
    make -j $(nproc) && \
    make install && \
    rm -rf /ikos/*
WORKDIR /entry
COPY run.sh ./run.sh
WORKDIR /ikos
ENTRYPOINT ["/entry/run.sh"]
