FROM ubuntu

ENV PACKAGES "python-setuptools  gcc libpython2.7-dev libxml2-dev libxslt1-dev libffi-dev libssl-dev libjpeg-dev"

RUN  apt-get update \
    && apt-get install -y --no-install-recommends libterm-readline-perl-perl \
    # install mitmproxy \
    && apt-get install -y --no-install-recommends $PACKAGES \
    && easy_install pip \
    && pip install requests \
    && pip install netlib==0.11.2 \
    && pip install mitmproxy==0.11.3 \
    && apt-get remove -y $PACKAGES \
    && apt-get autoremove -y \
    && apt-get clean

ENV LANG=de_DE.UTF-8
