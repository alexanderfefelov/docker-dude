FROM ubuntu:20.04

ENV DUDE_VERSION=4.0beta3

ENV DUDE_STUFF=dude-install-$DUDE_VERSION.exe

COPY container/ /
COPY installer/$DUDE_STUFF /

RUN dpkg --add-architecture i386 \
  && apt-get -qq update \
  && apt-get -qq --option APT::Immediate-Configure=false install --no-install-recommends \
       netcat \
       p7zip-full \
       wine32 \
       xvfb \
       > /dev/null \
  && 7z x -o/dude /$DUDE_STUFF > /dev/null \
  && chmod +x /dude/dude.exe \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm --force /$DUDE_STUFF

WORKDIR /dude

CMD ["/dude.sh"]
