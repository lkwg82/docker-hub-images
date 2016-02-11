FROM jenkins

USER root

ENV DOCKER_ENGINE_VERSION  1.9.1-0~jessie
ENV DOCKER_COMPOSE_VERSION 1.6.0

# installation steps from https://docs.docker.com/engine/installation/linux/debian/
RUN apt-get update \
    && apt-get install apt-transport-https ca-certificates rsync -y \
    && apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D \
    && echo "deb https://apt.dockerproject.org/repo debian-jessie main" > /etc/apt/sources.list.d/docker.list \
    && apt-get update \
    && apt-cache policy docker-engine \
    && apt-get upgrade -y \
    && apt-get install docker-engine=$DOCKER_ENGINE_VERSION -y \
    && gpasswd -a jenkins docker \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

USER jenkins

