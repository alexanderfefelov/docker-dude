FROM ubuntu:20.04

ENV DUDE_VERSION=4.0beta3
ARG DUDE_STUFF=dude-install-$DUDE_VERSION.exe

ARG DUDE_HOME=/dude

COPY installer/$DUDE_STUFF /

RUN dpkg --add-architecture i386 \
  && apt-get -qq update \
  && apt-get -qq --option APT::Immediate-Configure=false install --no-install-recommends \
       netcat \
       p7zip-full \
       wine32 \
       xvfb \
       > /dev/null \
  && 7z x -o$DUDE_HOME \
       -x!uninstall.exe \
       -x!data/files/*.ttf \
       -x!data/files/images/* \
       -x!data/files/mibs/* \
       $DUDE_STUFF \
       > /dev/null \
  && chmod +x $DUDE_HOME/dude.exe \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm --force $DUDE_STUFF

COPY container/ /

WORKDIR $DUDE_HOME
ENV DISPLAY=:0

CMD ["/entrypoint.sh"]
