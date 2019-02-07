# Build:
#   - docker build --build-arg VERSION=3.4.0 -t jeffjerseycow/tinkerpop:3.4.0 .
#   - docker build --build-arg VERSION=3.3.5 -t jeffjerseycow/tinkerpop:3.3.5 .
#
# This will build and configure the appropriate version listed in the apache distribution directory
# from https://www.apache.org/dist/tinkerpop/
#
# By default it uses the /data directory to store a neo4j backend
#
# Run:
#   - docker run --rm -ti -v/BACKEND/DIRECTORY:/data -p 8182:8182 jeffjerseycow/tinkerpop:3.3.5

FROM openjdk:8u151-jre-alpine3.7

ARG VERSION
ENV GREMLIN_SERVER_VERSION ${VERSION}
ENV GREMLIN_SERVER_URI https://www.apache.org/dist/tinkerpop/${GREMLIN_SERVER_VERSION}/apache-tinkerpop-gremlin-server-${GREMLIN_SERVER_VERSION}-bin.zip

WORKDIR /opt
RUN apk add --update bash perl wget unzip \
    && rm -rf /var/cache/apk/* \
    && wget ${GREMLIN_SERVER_URI} \
    && unzip apache-tinkerpop-gremlin-server-${GREMLIN_SERVER_VERSION}-bin.zip \
    && rm -f apache-tinkerpop-gremlin-server-${GREMLIN_SERVER_VERSION}-bin.zip \
    && mv apache-tinkerpop-gremlin-server-${GREMLIN_SERVER_VERSION} gremlin-server \
    && gremlin-server/bin/gremlin-server.sh install org.apache.tinkerpop neo4j-gremlin ${GREMLIN_SERVER_VERSION} \
    && sed -i 's/\/tmp\/neo4j/\/data/' gremlin-server/conf/neo4j-empty.properties \
    && sed -i 's/\/tmp\/neo4j/\/data/' gremlin-server/conf/neo4j-empty.properties \
    && mkdir /data \
    && apk del wget unzip --purge

WORKDIR /entrypoint
COPY run.sh ./run.sh

WORKDIR /opt/gremlin-server
EXPOSE 8182
ENTRYPOINT ["/entrypoint/run.sh"]
