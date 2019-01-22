FROM jeffjerseycow/debug-multiarch:latest
ENV INITIALUSER debug
ENV INITIALDIR /debug
WORKDIR /tools
RUN apt-get update && \
    apt-get install git sudo gdb-multiarch -y && \
    git clone https://github.com/electricworry/gef.git
WORKDIR /entry
COPY run.sh ./run.sh
COPY ppcinit ./ppcinit
WORKDIR /usr/bin
COPY gdb-ppc ./gdb-ppc
WORKDIR /debug
ENTRYPOINT ["/entry/run.sh"]
