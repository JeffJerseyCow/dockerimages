#!/usr/bin/env sh
IP=$(ip -o -4 addr list eth0 | perl -n -e 'if (m{inet\s([\d\.]+)\/\d+\s}xms) { print $1 }')
sed -i "s|^host:.*|host: $IP|" /opt/gremlin-server/conf/gremlin-server-neo4j.yaml
/opt/gremlin-server/bin/gremlin-server.sh /opt/gremlin-server/conf/gremlin-server-neo4j.yaml
