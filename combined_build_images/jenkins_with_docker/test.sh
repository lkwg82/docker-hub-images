#! /bin/bash

set -e

docker build -t test .
cid=$(docker run --network=host -v /var/run/docker.sock:/var/run/docker.sock -d test)

function finish {
	docker rm -f ${cid}  
}
trap finish EXIT


# tests
echo "testing"
docker exec ${cid} docker --version > /dev/null
docker exec ${cid} docker run alpine echo 'Hello world' > /dev/null
docker exec ${cid} docker-compose --version > /dev/null

sleep 10
for i in `seq 1 10`; do
	echo " checking status $i "
	[ "$(docker inspect --format '{{.State.Health.Status}}' $cid)" == "healthy" ] && echo "... success " && exit 0
	sleep 5
done	

echo "failed"
exit 1
