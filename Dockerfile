FROM ubuntu:14.10

MAINTAINER Szabolcs Gyuris <szimszon@oregpreshaz.eu>
# Originaly created by: Chris Daish <chrisdaish@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV uid 1000
ENV gid 1000
ENV PULSE_SERVER=172.17.42.1:4713

COPY AptSources /etc/apt/sources.list.d/
RUN apt-get update; \
    apt-get -y upgrade
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections; \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886; \
    apt-get update; \
    apt-get install -y  firefox \
                        dbus-x11 \
                        adobe-flashplugin \
                        libxext-dev \
                        libxrender-dev \
                        libxtst-dev \
                        oracle-java8-installer \
                        oracle-java8-set-default
RUN apt-get -y install pulseaudio alsa
RUN rm -rf /var/lib/apt/lists/*
RUN useradd -m firefox; \
    adduser firefox audio; \
    adduser firefox pulse-access


COPY start-firefox.sh /tmp/

ENTRYPOINT ["/tmp/start-firefox.sh"]
