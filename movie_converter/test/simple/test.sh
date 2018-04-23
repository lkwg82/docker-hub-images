#!/bin/bash

set -e


function finish {
	local exitCode=$?
    set +x

	echo "cleanup"

	echo "---------"

	rm -f ${testFile}
    rm -f subdir/${testFile}

	if [ "$exitCode" == "0" ]; then
		echo "Test: SUCCESS"
	else
		echo "Test: failed"
		exit ${exitCode}
	fi
}
trap finish EXIT

# build image
pushd ../..
echo -n "building image ... "
iidFile=$(tempfile)
docker build --iidfile ${iidFile} .  > /dev/null
echo ok
popd


cmd="docker run --rm -ti \
	--cap-drop ALL \
	--volume ${PWD}:/data \
	--user ${UID} \
	$(cat ${iidFile})"


#set -x

testFile="VID_20180423_205710.mp4.out.mp4";
rm -f ${testFile}
rm -f subdir/${testFile}

# tests
$cmd ffmpeg -version >/dev/null

echo "test convert run"
$cmd convertCamVideo2ArchivVideo > /dev/null

echo "test audio"
$cmd ffprobe ${testFile} | grep "Audio: mp3 (mp4a / 0x6134706D), 48000 Hz, stereo, s16p, 92 kb/s" > /dev/null

echo "test audio of file in subdir"
$cmd ffprobe subdir/${testFile} | grep "Audio: mp3 (mp4a / 0x6134706D), 48000 Hz, stereo, s16p, 92 kb/s" > /dev/null

echo "test video"
$cmd ffprobe ${testFile} | grep "Video: hevc (Main) (hev1 / 0x31766568), yuv420p(tv, progressive), 240x320" > /dev/null



