#!/bin/bash

#VERSION=v1.5.0
VERSION=$1

docker buildx create --use --name mybuild

docker buildx build --build-arg version=${VERSION} -t xxxsen/xray-core:${VERSION} \
  --platform=linux/amd64,linux/arm64,linux/ppc64le,linux/386,linux/arm/v7,linux/arm/v6 . --push
docker buildx build --build-arg version=${VERSION} -t xxxsen/xray-core:latest \
  --platform=linux/amd64,linux/arm64,linux/ppc64le,linux/386,linux/arm/v7,linux/arm/v6 . --push
