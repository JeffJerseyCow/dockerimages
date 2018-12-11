FROM amd64/ubuntu:18.04

# bootstrap system
RUN apt-get update && \
    apt-get install subversion vim htop build-essential git cmake python python3 -y

# download llvm
RUN cd /opt && \
    svn co http://llvm.org/svn/llvm-project/llvm/trunk llvm && \
    cd llvm/tools && \
    svn co http://llvm.org/svn/llvm-project/cfe/trunk clang && \
    cd ../.. && \
    cd llvm/tools/clang/tools && \
    svn co http://llvm.org/svn/llvm-project/clang-tools-extra/trunk extra && \
    cd ../../../.. && \
    cd llvm/projects && \
    svn co http://llvm.org/svn/llvm-project/compiler-rt/trunk compiler-rt

## compile
RUN mkdir /opt/llvm/build && \
    cd /opt/llvm/build && \
    cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release .. && \
    make -j 4

## install
RUN cd /opt/llvm/build && \
    make install && \
    mkdir /data

WORKDIR /data

CMD ["/bin/bash"]


