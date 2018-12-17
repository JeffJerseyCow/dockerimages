FROM jeffjerseycow/llvm:8.0
RUN apt-get install sudo -y
WORKDIR /entry
COPY run.sh ./run.sh
WORKDIR /fuzz
ENTRYPOINT ["/entry/run.sh"]
