#! /bin/bash

set -e

docker build -t test .
cid=$(docker run -d -v "/var/run/docker.sock:/var/run/docker.sock" test)

function finish {
	echo -n "cleanup: "
	docker rm -f ${cid}  
}
trap finish EXIT

# helper funcs
function de { docker exec -ti ${cid} $@; }

# test funcs
function t  { echo -n " test $@ ... "; }
function tde { de $@ >/dev/null  && echo "ok" || (echo "fail" && exit 1) }

# tests
echo "testing"

t " docker installed"
tde docker --version

t " docker-compose installed"
tde docker-compose --version

t " checking health of container (wait a little)"
sleep 15
docker inspect --format='{{json .State.Health.Status}}' $cid | grep -q 'healthy'
