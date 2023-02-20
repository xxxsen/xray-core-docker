FROM golang:1.20

ARG VERSION=v1.7.5

WORKDIR /data
RUN git clone https://github.com/XTLS/Xray-core.git core
WORKDIR /data/core
RUN git checkout $VERSION && CGO_ENABLED=0 go build -buildvcs=false -o xray -a -tags netgo -trimpath -ldflags "-s -w -buildid=" ./main

FROM alpine:3.12
COPY --from=0 /data/core/xray /bin

