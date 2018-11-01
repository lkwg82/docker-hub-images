FROM alpine:3.8
MAINTAINER Lars K.W. Gohlke <lkwg82@gmx.de>

RUN apk update \
    && apk upgrade \
    && apk add -U bash ffmpeg 

ADD convertCamVideo2ArchivVideo.sh /usr/bin/convertCamVideo2ArchivVideo

WORKDIR /data
