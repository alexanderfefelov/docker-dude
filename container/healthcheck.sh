#!/bin/sh

nc -z -w 1 localhost 2210 \
&& nc -z -w 1 localhost 2211
