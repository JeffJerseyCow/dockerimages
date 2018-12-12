FROM jeffjerseycow/llvm:8.0
RUN mkdir /in && \
    mkdir /corpus && \
    mkdir /artifacts
WORKDIR /fuzz
COPY run.sh ./run.sh
ENTRYPOINT ["/fuzz/run.sh"]
