FROM phusion/baseimage

ENV VERSION 4.0beta3

ENV DEBIAN_FRONTEND noninteractive
WORKDIR /dude
RUN dpkg --add-architecture i386 \
  && apt-get install --yes --no-install-recommends software-properties-common \
  && add-apt-repository --yes ppa:ubuntu-wine/ppa \
  && apt-get update \
  && apt-get install --yes --no-install-recommends wget p7zip-full xvfb wine1.8 \
  && wget -q http://download.mikrotik.com/dude/$VERSION/dude-install-$VERSION.exe \
  && 7z x dude-install-$VERSION.exe \
  && chmod +x dude.exe \
  && mkdir /etc/service/dude \
  && rm dude-install-$VERSION.exe \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY container/dude.sh /etc/service/dude/run

VOLUME /dude
VOLUME /root/.wine

CMD ["/sbin/my_init"]
