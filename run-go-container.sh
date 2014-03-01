#!/usr/bin/env bash

IMAGE_ID=$1
if [[ -z $IMAGE_ID ]]; then
  echo "You did not specify the Go image ID to run."
  echo "Usage: $(basename $0) <image_id>"
  exit 1
fi

LOCAL_IP=$(wget -qO- http://instance-data/latest/meta-data/local-ipv4)
docker run -p $LOCAL_IP:80:8153 $IMAGE_ID
