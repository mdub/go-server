#!/usr/bin/env bash
cd $(dirname $0)
LOCAL_IP=$(wget -qO- http://instance-data/latest/meta-data/local-ipv4)
docker run -i -t -p $LOCAL_IP:80:8153 ashlineldridge/go-server $@
