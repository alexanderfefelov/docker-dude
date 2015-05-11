#!/bin/sh

export DISPLAY=:1
rm -f /tmp/.X1-lock
Xvfb :1 -screen 0 800x600x16 &
# Prevents Wine from prompting for Mono and Gecko
export WINEDLLOVERRIDES="mscoree,mshtml="
wine 'z:\dude\dude.exe' --server
