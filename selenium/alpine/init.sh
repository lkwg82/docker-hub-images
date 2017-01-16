#!/bin/sh

set -ex

xvfb.sh DISPLAY start

while(true); do sleep 100; done
