FROM ubuntu:18.04
ENV INITIALUSER debug
ENV INITIALDIR /debug
RUN apt-get update && \
    apt-get install sudo gdb-multiarch qemu -y
WORKDIR /entry
COPY run.sh ./run.sh
COPY ppcinit ./ppcinit
WORKDIR /usr/bin
COPY gdb-ppc ./gdb-ppc
WORKDIR /debug
ENTRYPOINT ["/entry/run.sh"]

