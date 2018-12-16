FROM jeffjerseycow/llvm:8.0
WORKDIR /afl
RUN apt-get update && \
    apt-get install git -y && \
    git clone https://github.com/mcarpenter/afl.git && \
    cd afl && \
    make && \
    make install && \
    cd llvm_mode && \
    make && \
    cd .. && \
    make install && \
    mkdir /in && \
    mkdir /fuzzin && \
    mkdir /fuzzout
WORKDIR /fuzz
ENTRYPOINT ["bash"]
