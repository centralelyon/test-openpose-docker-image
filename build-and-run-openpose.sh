#!/bin/bash

docker build -t openpose .

docker run --rm -v /home/fconil/docker/openpose/videos:/data/videos -it openpose
