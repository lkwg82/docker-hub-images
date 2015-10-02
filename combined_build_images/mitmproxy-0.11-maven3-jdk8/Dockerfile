FROM lkwg82/selenium

# install mitmproxy
RUN apt-get update \
    && apt-get install -y --no-install-recommends python-setuptools  gcc libpython2.7-dev libxml2-dev libxslt1-dev libffi-dev libssl-dev git subversion\
    && easy_install pip \
    && pip install requests \
    && pip install netlib==0.11.2 mitmproxy==0.11.3 \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
