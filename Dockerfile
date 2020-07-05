FROM phusion/baseimage:0.10.2

ENV VERSION 4.0beta3

COPY container/ /
COPY installer/dude-install-$VERSION.exe /

ENV DEBIAN_FRONTEND noninteractive
RUN dpkg --add-architecture i386 \
  && add-apt-repository --yes ppa:ubuntu-wine/ppa \
  && apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       p7zip-full \
       wine1.8 \
       xvfb \
  && 7z x -o/dude /dude-install-$VERSION.exe \
  && chmod +x /dude/dude.exe \
  && rm /dude-install-$VERSION.exe \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/sbin/my_init"]
