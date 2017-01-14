FROM ubuntu:14.04

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y git python curl

RUN mkdir -p /data/build \
    && cd /data/build \
    && curl -sL "https://chromium.googlesource.com/chromium/src.git/+archive/master/build.tar.gz" | tar -xzf - 
RUN cd /data/build && ./install-build-deps.sh --no-prompt
RUN cd /data \
    && git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git

RUN useradd -ms /bin/sh user \
    && mkdir -p /data \
    && chown user /data

ADD chrome-init.sh /bin/
ADD chrome-compile.sh /bin/
ADD chrome-build.sh /bin/

#USER user
WORKDIR /data
CMD chrome-build.sh
