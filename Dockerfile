FROM golang:1.17-buster

ARG version=v1.5.0

RUN git clone https://github.com/XTLS/Xray-core.git xray && cd xray && git checkout ${version}
WORKDIR xray
RUN go build -o xray -trimpath -a -tags netgo -ldflags "-s -w -buildid=" ./main

FROM alpine:3.12

COPY --from=0 /go/xray/xray /bin/
RUN ln -s /bin/xray /bin/v2ray


