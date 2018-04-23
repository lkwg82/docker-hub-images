#FROM ubuntu:18.04
#
#RUN apt-get update \
#    && apt-get upgrade -y \
#    && apt-get install -y --no-install-recommends \
#        ffmpeg \
#        libimage-exiftool-perl \
#    && apt-get clean \
#    && apt-get autoremove -y

FROM alpine:3.7
MAINTAINER Lars K.W. Gohlke <lkwg82@gmx.de>

RUN apk update \
    && apk upgrade \
    && apk add -U bash ffmpeg

ADD convertCamVideo2ArchivVideo.sh /usr/bin/convertCamVideo2ArchivVideo

WORKDIR /data
