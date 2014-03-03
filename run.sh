#!/usr/bin/env bash

GO_SERVER=$(wget -qO- http://instance-data/latest/meta-data/local-ipv4)
docker run -i -t -p $GO_SERVER:80:8153 -p $GO_SERVER:8153:8153 -p $GO_SERVER:8154:8154 ashlineldridge/go-server $@
