FROM golang:alpine
MAINTAINER Fabrice Aneche <akh@nobugware.com>

RUN apk add --update \
  git \
  make \
  && rm -rf /var/cache/apk/*

RUN go get github.com/akhenakh/regionagogo
RUN go get github.com/jteeuwen/go-bindata/...
RUN cd /go/src/github.com/akhenakh/regionagogo && make
RUN go install github.com/akhenakh/regionagogo/...
RUN cd /go/src/github.com/akhenakh/regionagogo && make clean

USER nobody
ENTRYPOINT /go/bin/regionagogo

EXPOSE 8082