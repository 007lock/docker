Dockerfiles
===========

Docker for circle ci, included:

* golang.org/x/lint/golint
* github.com/matryer/moq
* lib-vips

# Build docker

```shell
docker build -t 007lock/circleci-golang .
```

# Run docker

```shell
docker run 007lock/circleci-golang
```

# Use this image with your `.circleci/config.yml`

```
version: 2.1
jobs:
  build:
    docker:
      - image: 007lock/circleci-golang:latest
    ...
```
or
Replace image `circleci/golang:latest` => `007lock/circleci-golang:latest`
