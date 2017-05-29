# install Ubuntu and selenium and chromedriver 
FROM selenium/standalone-chrome

MAINTAINER Prigornev Ivan <v1ar31@gmail.com>

# install nodejs and npm
RUN apt-get update
RUN apt-get install nodejs
RUN apt-get install npm

# install phantomjs
RUN mkdir /tmp/phantomjs \
    && curl -L https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 \
           | tar -xj --strip-components=1 -C /tmp/phantomjs \
    && mv /tmp/phantomjs/bin/phantomjs /usr/bin \
    && rm -rf /tmp/phantomjs
