#! /bin/bash

set -e

docker build -t test .
cid=$(docker run -d test sleep 10000)

function finish {
	echo -n "cleanup: "
	docker rm -f ${cid}  
}
trap finish EXIT

# helper funcs
function de { docker exec -ti ${cid} $@; }

# test funcs
function t  { echo -n " test $@ ... "; }
function tde { de $@ > /dev/null && echo "ok" || echo "fail"; }

# tests
echo "testing"

t " git installed"
tde git version

t " google depot tools installed"
tde test -x /data/depot_tools/gclient

