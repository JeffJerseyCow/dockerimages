# Build:
# 	docker build --build-arg TAG=3.4.2 --build-arg VERSION=3.4.2 -t jeffjerseycow/tinkerpop:3.4.2 .	
# Run:
#	docker run -d --name tinkerpop -p 8182:8182 --mount source=tinkerpop,target=/data jeffjerseycow/tinkerpop:3.4.2 conf/gremlin-server-neo4j.yaml
ARG TAG
FROM tinkerpop/gremlin-server:${TAG}

USER root
WORKDIR /data
RUN chown -R gremlin:gremlin /data 

USER gremlin
WORKDIR /opt/gremlin-server

ARG VERSION
RUN bin/gremlin-server.sh install org.apache.tinkerpop neo4j-gremlin ${VERSION} && \
    sed -i 's/\/tmp\/neo4j/\/data/' conf/neo4j-empty.properties

EXPOSE 8182
