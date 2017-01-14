#!/bin/bash

export PATH=$PATH:/data/depot_tools

if [ -d /data/Chromium ]; then
	cd /data/Chromium
	gclient sync
else	
	mkdir -p /data/Chromium 
	cd /data/Chromium 
	fetch --no-history chromium
fi	
