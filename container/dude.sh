#!/bin/sh

rm --force /tmp/.X1-lock

export DISPLAY=:1
Xvfb :1 -screen 0 800x600x16 &
# Prevents Wine from prompting for Mono and Gecko
export WINEDLLOVERRIDES="mscoree,mshtml="
/usr/lib/wine/wine "z:\dude\dude.exe" --server
