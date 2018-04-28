#!/bin/bash

set -o pipefail

docker build -t lkwg82/movie-converter .
docker push lkwg82/movie-converter
