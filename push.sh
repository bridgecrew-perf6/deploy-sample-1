#!/bin/sh

LC=$(git rev-parse --short HEAD)
docker build -t ghcr.io/kijimad/webapp:${LC} .
docker push ghcr.io/kijimad/webapp:${LC}
