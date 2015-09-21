FROM maven:3-jdk-8

# install mitmproxy
RUN apt-get install -y --no-install-recommends python-setuptools  gcc libpython2.7-dev libxml2-dev libxslt1-dev libffi-dev libssl-dev \
    && easy_install pip \
    && pip install requests \
    && pip install netlib==0.11.2 mitmproxy==0.11.3

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && apt-get update \
    && apt-get install -y libgtk2.0-0 libappindicator1 \
    && apt-get install -y xdg-utils libasound2  libnss3  libxss1  gconf-service libgconf-2-4 libpango1.0-0 \
    && dpkg -i google-chrome-stable_current_amd64.deb \
    && apt-get install -y xvfb \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/*
