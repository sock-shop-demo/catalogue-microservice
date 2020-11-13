#!/usr/bin/env sh

set -ev

export BUILD_VERSION="0.0.2-SNAPSHOT"
export BUILD_DATE=`date +%Y-%m-%dT%T%z`

SCRIPT_DIR=$(dirname "$0")

if [ -z "$GROUP" ] ; then
    echo "Cannot find GROUP env var"
    exit 1
fi

if [ -z "$COMMIT" ] ; then
    echo "Cannot find COMMIT env var"
    exit 1
fi

CODE_DIR=$(cd $SCRIPT_DIR/..; pwd)
echo $CODE_DIR
 
mkdir -p $CODE_DIR/build
BUILD_DIR=$CODE_DIR/build

cp -r $CODE_DIR/docker $BUILD_DIR/
cp -r $CODE_DIR/images/ $BUILD_DIR/docker/catalogue/images/
cp -r $CODE_DIR/cmd/ $BUILD_DIR/docker/catalogue/cmd/
cp $CODE_DIR/*.go $BUILD_DIR/docker/catalogue/
mkdir -p $BUILD_DIR/docker/catalogue/vendor/ && \
cp $CODE_DIR/vendor/manifest $BUILD_DIR/docker/catalogue/vendor/

REPO=${GROUP}/$(basename catalogue);

docker build \
  -v /home/runner/work/catalogue-microservice/catalogue-microservice/go/src/github.com/sock-shop-demo/catalogue-microservice/vendor:/go/src/ \
  -v /home/runner/work/catalogue-microservice/catalogue-microservice/go/src/github.com/sock-shop-demo/catalogue-microservice/test/..:/go/src/github.com/microservices-demo/catalogue \
  -t ${REPO}:${COMMIT} \
  -f $BUILD_DIR/docker/catalogue/Dockerfile $BUILD_DIR/docker/catalogue;

rm -rf $BUILD_DIR
