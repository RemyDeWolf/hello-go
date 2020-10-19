
FROM golang:alpine AS builder
WORKDIR /go/src/app

COPY go.mod go.sum main.go ./
COPY *.go ./

RUN go mod tidy
RUN go test -v ./...

ARG VERSION=dev
RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /go/bin/main *.go


FROM alpine:latest

# set environment variables
ENV USER_UID=1001 \
  USER_NAME=go

# install the binary built in previous stage
COPY --from=builder /go/bin/main /usr/local/bin/main

# set entrypoint
ENTRYPOINT ["/usr/local/bin/main"]

# directory for application files
RUN mkdir /data
RUN chown -R $USER_UID /data

# switch to non-root user
USER ${USER_UID}
