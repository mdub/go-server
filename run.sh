#!/usr/bin/env bash
cd $(dirname $0)
LOCAL_IP=$(wget -qO- http://instance-data/latest/meta-data/local-ipv4)
PORT=${1:-8153}
docker run -i -t -p $LOCAL_IP:$PORT:8153 ashlineldridge/go-server $@
