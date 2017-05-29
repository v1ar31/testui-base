# install Ubuntu and selenium and chromedriver 
FROM selenium/standalone-chrome

MAINTAINER Prigornev Ivan <v1ar31@gmail.com>

# install tools
RUN sudo apt-get update

RUN sudo apt-get install -y nodejs npm
RUN sudo apt-get install -y wget tar

# install phantomjs
RUN sudo apt-get install -y build-essential chrpath libssl-dev libxft-dev
RUN sudo apt-get install -y libfreetype6 libfreetype6-dev
RUN sudo apt-get install -y libfontconfig1 libfontconfig1-dev

ENV PHANTOM_JS phantomjs-2.1.1-linux-x86_64

RUN sudo wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2
RUN sudo tar xvjf $PHANTOM_JS.tar.bz2

RUN sudo mv $PHANTOM_JS /usr/local/share
RUN sudo ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin

RUN sudo rm -rf $PHANTOM_JS
RUN sudo rm $PHANTOM_JS.tar.bz2

# clear image
RUN sudo apt-get purge -y wget
RUN sudo apt-get autoremove -y
RUN sudo apt-get clean
