#!/bin/bash

rm --force /tmp/.X$DISPLAY-lock

Xvfb &
# Prevents Wine from prompting for Mono and Gecko
export WINEDLLOVERRIDES="mscoree,mshtml="
/usr/lib/wine/wine "z:\dude\dude.exe" --server
