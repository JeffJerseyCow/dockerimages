FROM jeffjerseycow/llvm:8.0
WORKDIR /build
ENV INITIALUSER afl
ENV INITIALDIR /afl
RUN apt-get update && \
    apt-get install sudo git -y && \
    git clone https://github.com/mcarpenter/afl.git && \
    cd afl && \
    make && \
    make install && \
    cd llvm_mode && \
    make && \
    cd .. && \
    make install
WORKDIR /entry
COPY run.sh ./run.sh
WORKDIR /afl
ENTRYPOINT ["/entry/run.sh"]
