FROM jeffjerseycow/debug-multiarch:latest
WORKDIR /debug
RUN apt-get update && \
    apt-get install build-essential -y
COPY mips/ mips/
COPY aarch64/ aarch64/
COPY mips64/ mips64/
COPY ppc/ ppc/
COPY ppc64/ ppc64/
COPY riscv64/ riscv64/
COPY arm/ arm/
COPY x86/ x86/
COPY x86-64/ x86-64/
ENTRYPOINT ["bash"]
