#!/usr/bin/env bash

set -ev

docker run --rm \
         -v /home/runner/work/catalogue-microservice/catalogue-microservice/go/src/github.com/sock-shop-demo/catalogue-microservice/vendor:/go/src/ \
         -v /home/runner/work/catalogue-microservice/catalogue-microservice/go/src/github.com/sock-shop-demo/catalogue-microservice/test/..:/go/src/github.com/microservices-demo/catalogue \
         -w /go/src/github.com/microservices-demo/catalogue \
         -e GOPATH=/go/ golang:1.7 go test -v -covermode=count -coverprofile=coverage.out