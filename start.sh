#!/usr/bin/env bash

cat > /etc/default/go-server <<HERE
GO_SERVER_PORT=80
export GO_SERVER_PORT
GO_SERVER_SSL_PORT=443
export GO_SERVER_SSL_PORT
SERVER_WORK_DIR=/var/lib/go-server
export SERVER_WORK_DIR
DAEMON=N
JAVA_HOME=/usr/lib/jvm/java-7-oracle/jre
export JAVA_HOME
HERE

/etc/init.d/go-server start
