FROM golang:alpine AS builder

RUN apk add --no-cache gcc \
        g++ \
        make \
        git \
        curl \
        libc-dev \
        musl-dev \
        vips-dev \
    && rm -vrf /var/cache/apk/*

WORKDIR /go/src/app
RUN go get -u golang.org/x/lint/golint
