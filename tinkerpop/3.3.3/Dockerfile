FROM ubuntu:18.04

ENV GREMLIN_SERVER_VERSION 3.3.3
ENV GREMLIN_SERVER_ZIP_URI http://mirror.ox.ac.uk/sites/rsync.apache.org/tinkerpop/3.3.3/apache-tinkerpop-gremlin-server-$GREMLIN_SERVER_VERSION-bin.zip

RUN apt-get update \
    && apt-get install build-essential openjdk-11-jre-headless openjdk-11-jdk wget curl unzip vim htop git python python3 python-pip python3-pip python-virtualenv python3-virtualenv -y \
    && cd /opt \
    && wget $GREMLIN_SERVER_ZIP_URI \
    && unzip apache-tinkerpop-gremlin-server-$GREMLIN_SERVER_VERSION-bin.zip \
    && ln -s apache-tinkerpop-gremlin-server-$GREMLIN_SERVER_VERSION gremlin-server \
    && cd /opt/gremlin-server \
    && bin/gremlin-server.sh -i org.apache.tinkerpop neo4j-gremlin $GREMLIN_SERVER_VERSION

RUN cd /opt/gremlin-server \
    && apt-get install iproute2 -y \
    && IP=$(ip -o -4 addr list eth0 | perl -n -e 'if (m{inet\s([\d\.]+)\/\d+\s}xms) { print $1 }') \
    && sed -i "s|^host:.*|host: $IP|" conf/gremlin-server-neo4j.yaml \
    && sed -i 's/\/tmp\/neo4j/\/data/' conf/neo4j-empty.properties

EXPOSE 8182

WORKDIR /opt/gremlin-server

CMD ["/opt/gremlin-server/bin/gremlin-server.sh", "/opt/gremlin-server/conf/gremlin-server-neo4j.yaml"]
