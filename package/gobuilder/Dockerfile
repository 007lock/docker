FROM golang:alpine AS builder

RUN apk add --no-cache gcc \
        g++ \
        make \
        git \
        libc-dev \
        musl-dev \
        vips-dev
WORKDIR /go/src/app
RUN go get -u golang.org/x/lint/golint
