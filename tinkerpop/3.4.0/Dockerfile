# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

FROM openjdk:8u151-jre-alpine3.7

ENV GREMLIN_SERVER_VERSION 3.4.0
ENV GREMLIN_SERVER_URI https://www.apache.org/dist/tinkerpop/${GREMLIN_SERVER_VERSION}/apache-tinkerpop-gremlin-server-${GREMLIN_SERVER_VERSION}-bin.zip

WORKDIR /opt

RUN apk add --update bash perl wget unzip \
    && rm -rf /var/cache/apk/* \
    && wget ${GREMLIN_SERVER_URI} \
    && unzip apache-tinkerpop-gremlin-server-${GREMLIN_SERVER_VERSION}-bin.zip \
    && rm -f apache-tinkerpop-gremlin-server-${GREMLIN_SERVER_VERSION}-bin.zip \
    && mv apache-tinkerpop-gremlin-server-${GREMLIN_SERVER_VERSION} gremlin-server \
    && gremlin-server/bin/gremlin-server.sh install org.apache.tinkerpop neo4j-gremlin ${GREMLIN_SERVER_VERSION} \
    && IP=$(ip -o -4 addr list eth0 | perl -n -e 'if (m{inet\s([\d\.]+)\/\d+\s}xms) { print $1 }') \
    && sed -i "s|^host:.*|host: $IP|" gremlin-server/conf/gremlin-server-neo4j.yaml \
    && sed -i 's/\/tmp\/neo4j/\/data/' gremlin-server/conf/neo4j-empty.properties \
    && sed -i 's/\/tmp\/neo4j/\/data/' gremlin-server/conf/neo4j-empty.properties \
    && mkdir /data \
    && apk del wget unzip --purge

WORKDIR /opt/gremlin-server

EXPOSE 8182

CMD ["bin/gremlin-server.sh", "conf/gremlin-server-neo4j.yaml"]
