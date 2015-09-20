FROM maven:3.3.3-jdk-8

RUN apt-get update && apt-get upgrade -y \
        && apt-get install -y libappindicator1 libxss1 libpango1.0-0 xdg-utils \
        && apt-get install -y xvfb \
	&& wget  https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
	&& dpkg -i google-chrome-stable_current_amd64.deb \
	&& rm google-chrome-stable_current_amd64.deb
