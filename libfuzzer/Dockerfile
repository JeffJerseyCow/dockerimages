FROM jeffjerseycow/llvm:8.0
ENV INITIALUSER libfuzzer
ENV INITIALDIR /libfuzzer
RUN apt-get install sudo -y
WORKDIR /entry
COPY run.sh ./run.sh
WORKDIR /libfuzzer
ENTRYPOINT ["/entry/run.sh"]
