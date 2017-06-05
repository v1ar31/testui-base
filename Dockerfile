FROM selenium/node-chrome
# contains: ubuntu, jdk, selenium, chrome, chromedriver

MAINTAINER Prigornev Ivan <v1ar31@gmail.com>

USER root

#========================
# NodeJS
#========================
RUN apt-get update
RUN apt-get install curl -y

RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN apt-get install -y nodejs

RUN chsh -s /bin/bash
#========================
# PhantomJS
#========================
ENV PHANTOM_JS phantomjs-2.1.1-linux-x86_64

RUN wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2 \
  && tar xvjf $PHANTOM_JS.tar.bz2

RUN mv $PHANTOM_JS /usr/local/share
RUN ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin

RUN rm -rf $PHANTOM_JS
RUN rm $PHANTOM_JS.tar.bz2

#========================
# Virtual Display
#========================
RUN echo 'Xvfb :1 -screen 5 1024x768x8 & export DISPLAY=:1.5' >> ~/.bashrc

#========================
# Clear Image
#========================
# RUN sudo apt-get purge -y wget
RUN apt-get autoremove -y
RUN apt-get clean
