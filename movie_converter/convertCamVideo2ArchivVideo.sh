#!/bin/bash

set -e
#set -x

export globalargs="$@"

function exitEnter { echo $1; echo "press ENTER to exit"; read; }
function checkInstalled {
	printf "checking %-30s installed : "  $1;
	type $1 >/dev/null 2>&1 && echo "ok" || { echo "fail"; exitEnter; }
}

checkInstalled ffmpeg

function _convert(){
	local source=$1
#	local target="$1.out.mp4"
	local target="$1.h264.avi"
	local targetTmp="$1.tmp.out.mp4"
	if [ -f $target ];
	then
		echo "skipping '$source', because '$target' already exists"
	else
			
		#~ local metadata="$1.avi.metadata"
		#~ avconv -y -i $source -f ffmetadata -map_metadata 0:g $metadata
							
		#~ local audioOpts="-acodec libmp3lame -ab 160000  `# mp3 160kB/s`"
		# https://trac.ffmpeg.org/wiki/Encode/MP3
		local audioOpts="-acodec libmp3lame -q:a 4 -ar 48000`# mp3 140-185kbit/s`"
		#~ local audioOpts="-c:a copy"
		#~ local audioOpts=""
		
		
		local videoOpts="-vcodec libx264 -maxrate 4000k -bufsize 1M -r 25"
#		local videoOpts="-vcodec libx265 -maxrate 4000k -bufsize 1M -preset veryslow"
		#~ local videoOpts="-c:v copy"
		#~ local videoOpts="-codec copy"
		

		local cmd="ffmpeg -i $source \
			$audioOpts \
			$videoOpts
			-y `# overwrite files `\
			$targetTmp"

        echo "RUNNING $cmd"
		nice -n20 $cmd $globalargs && \
			mv $targetTmp $target && \
			touch -r "$source" "$target" 
	fi
}

export -f _convert

find -type f -iname "*MOV" -o -iname "*3gp" -o -iname "*mp4" -o -iname "*.avi" \
    | grep -v ".h264.avi" \
    | grep -v ".out.mp4" \
    | xargs -n1 -I {} bash -c '_convert {}'
#_convert $1
