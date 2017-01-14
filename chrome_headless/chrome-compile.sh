#!/bin/bash

set -e

export PATH=$PATH:/data/depot_tools

cd /data/Chromium/src
./build/install-build-deps.sh --no-prompt

mkdir -p out/Headless
echo 'import("//build/args/headless.gn")' > out/Headless/args.gn
echo 'is_debug = false' >> out/Headless/args.gn
gn gen out/Headless
ninja -C out/Headless headless_shell

echo 
echo "verify build"
out/Headless/headless_shell http://goat.com
