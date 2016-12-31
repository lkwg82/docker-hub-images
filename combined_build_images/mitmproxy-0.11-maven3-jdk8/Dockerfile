FROM lkwg82/selenium

# install mitmproxy
RUN apt-get update \
    && apt-get install -y --no-install-recommends python-setuptools  gcc libpython2.7-dev libxml2-dev libxslt1-dev libffi-dev libssl-dev git subversion libjpeg-dev \
    && easy_install pip \
    && pip install requests \
    && pip install netlib==0.11.2 mitmproxy==0.11.3 \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


    
ENV MAVEN_VERSION 3.3.9
		
RUN curl -fsSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
   && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
   && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven
