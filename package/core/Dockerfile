FROM golang:alpine

MAINTAINER Simon NG <007lock@gmail.com>

RUN mkdir -p /go/src/app
WORKDIR /go/src/app
ENV WORKINGDIR /go/src/app

# RUN apk update && apk upgrade && \
#     apk add --no-cache git g++ make curl tar gzip inotify-tools

# RUN cd /home && curl -L https://github.com/emcrisostomo/fswatch/releases/download/1.9.3/fswatch-1.9.3.tar.gz | tar xz \
#     && cd fswatch-1.9.3 && ./configure CXX=g++ && make && make install

# RUN apk del curl && rm -rf /home/fswatch-1.9.3
RUN apk update && apk upgrade && \
    apk add --no-cache git make docker && rm -rf /var/cache/apk/*

RUN go get -u -v github.com/codeskyblue/fswatch

ENTRYPOINT ["make"]

# ADD web/installAndStart.sh /root/
# RUN chmod 755 /root/installAndStart.sh
# RUN chmod +x /root/installAndStart.sh
