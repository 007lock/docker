FROM circleci/golang:latest

RUN go get -u golang.org/x/lint/golint
RUN go get -u github.com/matryer/moq
RUN sudo apt install libvips-dev curl \
    && sudo apt-get clean autoclean \
    && sudo apt-get autoremove --yes \
    && sudo rm -rf /var/lib/{apt,dpkg,cache,log}/