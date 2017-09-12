FROM jenkins:2.60.3

USER root

ENV DOCKER_VERSION         17.06.2-ce
ENV DOCKER_COMPOSE_VERSION 1.16.1

# https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-using-the-repository
RUN    apt-get update \
    && apt-get install -y --no-install-recommends \
               apt-transport-https \
               ca-certificates \
               curl \
               software-properties-common  \
               upx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && curl -fsSL https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_VERSION.tgz | tar -xzf - docker/docker \
    && upx -9v docker/docker \
    && mv docker/docker /usr/bin/docker \
    && rmdir docker

#    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - > /dev/null \
#    && apt-key fingerprint 0EBFCD88 2>/dev/null | grep -q "9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88"\
#    && add-apt-repository \
#      "deb [arch=amd64] https://download.docker.com/linux/debian \
#      $(lsb_release -cs) \
#      stable" \
#    && apt-get update \
#    && apt-get -y install docker-ce \
#    && apt-get clean

RUN echo "latest version of- compose" \
    && curl -sL https://api.github.com/repos/docker/compose/releases/latest | grep -E "tag_name|published_at" \
    && curl -fsSL https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/run.sh -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

RUN groupadd --gid 999 docker
RUN gpasswd -a jenkins docker

USER jenkins

HEALTHCHECK --interval=30s --timeout=3s --retries=10 \
  CMD test -f /var/run/docker.sock && (curl -sL http://localhost:8080 || exit 1)

