#!/bin/bash

set -e

image="release_$RANDOM"
docker build -t $image .

function finish {
        echo -n "cleanup: "
        docker rmi  $image
}
trap finish EXIT

function dr { docker run --rm -t $image "$@"; }

jreVersion=$(dr java -version | head -n1 | cut -d_ -f2 | sed -e 's#"##g' | tr -d '\r')
chromiumVersion=$(dr chromium-browser --version | cut -d\  -f2 | tr -d '\r')
alpineVersion=$(dr cat /etc/alpine-release | tr -d '\r') 

release="alpine${alpineVersion}_jre8u${jreVersion}_chromium${chromiumVersion}"
docker tag $image lkwg82/selenium:$release
docker push lkwg82/selenium:$release
