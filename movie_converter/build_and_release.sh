#!/bin/bash

set -o pipefail

if [[ $(git diff --stat) != '' ]]; then
  echo 'dirty repo, plz commit or revert'
  exit 1
fi

docker build -t lkwg82/movie-converter .
docker push lkwg82/movie-converter
