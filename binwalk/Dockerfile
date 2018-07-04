FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install gnupg -y && \
    echo "deb http://ftp.de.debian.org/debian jessie main " >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CBF8D6FD518E17E1 && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7638D0442B90D010 && \
    apt-get update && \
    apt-get install unzip wget python3 python -y && \
    mkdir ~/tools && \
    cd ~/tools/ && \
    wget https://github.com/devttys0/binwalk/archive/master.zip && \
    unzip master.zip && \
    printf '8\n27\n' | apt install tzdata -y && \
    cd binwalk-master/ && \
    yes | ./deps.sh && \
    python3 setup.py install && \
    apt-get install python-lzma python-crypto python3-crypto libqt4-opengl python-opengl  -y && \
    apt-get install python-qt4 python-qt4-gl python-numpy python-scipy python-pip -y && \
    apt-get install libqt4-opengl python3-opengl python3-pyqt4 python3-pyqt4.qtopengl -y && \
    apt-get install python3-numpy python3-scipy python3-pip zlib1g-dev liblzma-dev liblzo2-dev -y && \
    apt-get install liblzo2-dev python-lzo && \
    pip3 install nose coverage pyqtgraph capstone cstruct

RUN rm -rf ~/tools

WORKDIR /data

ENTRYPOINT ["bash"]
