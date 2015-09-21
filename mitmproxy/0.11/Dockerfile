FROM ubuntu:latest

RUN  apt-get update \
     && apt-get upgrade -y \
     && apt-get install -y --no-install-recommends libterm-readline-perl-perl \
     && apt-get clean

# install mitmproxy
RUN apt-get install -y --no-install-recommends python-setuptools  gcc libpython2.7-dev libxml2-dev libxslt1-dev libffi-dev libssl-dev \
    && easy_install pip \
    && pip install requests \
    && pip install netlib==0.11.2 mitmproxy==0.11.3

ENV LANG=de_DE.UTF-8