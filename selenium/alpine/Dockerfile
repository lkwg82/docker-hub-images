FROM alpine:3.6

RUN apk update \
    && apk upgrade \
    && apk add \
	chromium \
	chromium-chromedriver \
	openjdk8-jre \
        xterm \
	xvfb

RUN mkdir -p /tmp/.X11-unix && chmod 1777 /tmp/.X11-unix && chown root /tmp/.X11-unix/


ADD xvfb.sh /bin/
ADD init.sh /bin/
RUN adduser -D -s /bin/sh user
USER user

USER root

WORKDIR /home/user
USER user
ENV DISPLAY ":10.0"
CMD ["init.sh"]

