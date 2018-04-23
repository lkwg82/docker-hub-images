FROM ubuntu:18.04

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
        ffmpeg \
        libimage-exiftool-perl \
    && apt-get clean \
    && apt-get autoremove -y

ADD convertCamVideo2ArchivVideo.sh /usr/bin/convertCamVideo2ArchivVideo

WORKDIR /data
