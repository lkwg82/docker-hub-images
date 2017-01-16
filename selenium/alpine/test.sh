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
function de { docker exec -ti ${cid} "$@"; }
function fail { echo "fail"; exit $1; }; 

# test funcs
function t  { echo -n " test $@ ... "; }
function tde { de $@ > /dev/null && echo "ok" || fail $?; }

# tests
echo "testing"

t " chromedriver installed"
tde chromedriver --help

t " Xvfb installed"
tde Xvfb -help 

t " Xvfb running"
tde 'pgrep Xvfb'

t " chromium installed"
tde ash -c "export DISPLAY=:10; chromium-browser --version"

t " java installed"
tde java -version
