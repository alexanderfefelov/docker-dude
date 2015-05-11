#!/bin/sh

docker run --name dude --detach --volume /etc/localtime:/etc/localtime:ro --publish 2211:2211 --publish 2210:2210 alexanderfefelov/docker-dude
