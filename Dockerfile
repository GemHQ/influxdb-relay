FROM alpine:3.7

RUN apk add --no-cache \
  go \
  # Required for building Go
  git \
  make \
  musl-dev

# TODO: EXPOSE necessary port(s)
EXPOSE 9096
ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH

RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin

RUN go get -u github.com/influxdata/influxdb-relay

COPY relay.toml .

ENTRYPOINT ["influxdb-relay", "-config",  "relay.toml"]
