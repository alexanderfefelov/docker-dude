FROM phusion/baseimage

ENV VERSION 4.0beta3

ENV DEBIAN_FRONTEND noninteractive
COPY installer/dude-install-$VERSION.exe /
RUN dpkg --add-architecture i386 \
  && apt-get -qq install --no-install-recommends \
       software-properties-common \
  && add-apt-repository --yes ppa:ubuntu-wine/ppa \
  && apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       p7zip-full \
       wine1.8 \
       xvfb \
  && 7z x -o/dude /dude-install-$VERSION.exe \
  && chmod +x /dude/dude.exe \
  && mkdir /etc/service/dude \
  && rm /dude-install-$VERSION.exe \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY container/dude.sh /etc/service/dude/run

VOLUME /dude
VOLUME /root/.wine

CMD ["/sbin/my_init"]
