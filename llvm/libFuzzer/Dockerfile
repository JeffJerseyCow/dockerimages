FROM ubuntu:18.04
WORKDIR /build
RUN apt-get update && \
    apt-get install python subversion ninja-build cmake gcc g++ -y && \
    echo "[global]" > /etc/subversion/servers && \
    echo "http-proxy-host = 10.1.1.10" >> /etc/subversion/servers && \
    echo "http-proxy-port = 3128" >> /etc/subversion/servers && \
    svn co http://llvm.org/svn/llvm-project/llvm/trunk llvm && \
    cd llvm/tools && \
    svn co http://llvm.org/svn/llvm-project/cfe/trunk clang && \
    cd clang/tools && \
    svn co http://llvm.org/svn/llvm-project/clang-tools-extra/trunk extra && \
    cd ../../../projects && \
    svn co http://llvm.org/svn/llvm-project/compiler-rt/trunk compiler-rt
RUN cd llvm && \
    mkdir build && \
    cd build && \
    cmake -G "Ninja" .. -DCMAKE_BUILD_TYPE=Release && \
    ninja && \
    ninja install
RUN rm -rf /build/* && \
    mkdir /in && \
    mkdir /corpus && \
    mkdir /artifacts
WORKDIR /fuzz
COPY run.sh ./run.sh
ENTRYPOINT ["/fuzz/run.sh"]
