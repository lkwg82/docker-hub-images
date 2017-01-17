#!/bin/bash

set -e

image="release_$RANDOM"
docker build -t $image .

./test.sh

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

function tagPushDel { 
	docker tag $image $1; 
	docker push $1; 
	docker rmi $1; 
}

docker pull lkwg82/selenium:latest
latest=$(docker run --rm -t lkwg82/selenium:latest sha1sum /lib/apk/db/installed | cut -d\  -f1)
current=$(docker run --rm -t $image sha1sum /lib/apk/db/installed | cut -d\  -f1)

if [ "$latest" != "$current" ]; then
	tagPushDel lkwg82/selenium:$release
	tagPushDel lkwg82/selenium:latest
fi

