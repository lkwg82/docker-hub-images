#! /bin/bash

set -ex

docker build -t test .
cid=$(docker run --network=host -d test)

function finish {
	docker rm -f ${cid}  
}
trap finish EXIT

sleep 10
for i in `seq 1 10`; do
	echo "try $i"
	[ "$(docker inspect --format '{{.State.Health.Status}}' $cid)" == "healthy" ] && exit 0
	sleep 5
done	

echo "failed"
exit 1
