#! /bin/bash

set -e

docker build -t test .
cid=$(docker run -d test)

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

t " Xvfb installed"
tde Xvfb -help 

t " Xvfb running"
tde ps -C Xvfb

t " chrome"
docker exec -ti ${cid} bash -c "export DISPLAY=:10; chromium-browser --version"
