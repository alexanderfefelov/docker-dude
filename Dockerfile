FROM ubuntu:14.04.2
ENV DEBIAN_FRONTEND noninteractive
RUN dpkg --add-architecture i386 \
  && apt-get install --yes --no-install-recommends software-properties-common \
  && add-apt-repository -y ppa:ubuntu-wine/ppa \
  && apt-get update \
  && apt-get install --yes --no-install-recommends wget p7zip-full xvfb wine1.7
RUN mkdir /dude
WORKDIR /dude
RUN wget -q http://download.mikrotik.com/dude/4.0beta3/dude-install-4.0beta3.exe \
  && 7z x dude-install-4.0beta3.exe \
  && chmod +x dude.exe \
  && rm dude-install-4.0beta3.exe
VOLUME /dude
VOLUME /root/.wine
ADD container/dude.sh /
CMD ["/dude.sh"]
