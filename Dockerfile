FROM golang:1.10-alpine3.8 AS builder

RUN apk add --no-cache git \
    && go get github.com/jsha/minica

FROM alpine:3.8

COPY --from=builder /go/bin/minica /usr/local/bin/minica

WORKDIR /root/certificates

ENTRYPOINT  ["minica"]

