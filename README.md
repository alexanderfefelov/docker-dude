[![Docker Pulls](https://img.shields.io/docker/pulls/alexanderfefelov/dude.svg)](https://hub.docker.com/r/alexanderfefelov/dude)
[![Docker Stars](https://img.shields.io/docker/stars/alexanderfefelov/dude.svg)](https://hub.docker.com/r/alexanderfefelov/dude)
[![](https://images.microbadger.com/badges/version/alexanderfefelov/dude.svg)](https://microbadger.com/images/alexanderfefelov/dude)
[![](https://images.microbadger.com/badges/image/alexanderfefelov/dude.svg)](https://microbadger.com/images/alexanderfefelov/dude)


```
Attention! This is a server container, not a client!

Last version of The Dude server for Windows is 4.0beta3.

```

Just type

    docker run --name dude \
      --privileged \
      --detach \
      --volume /etc/localtime:/etc/localtime:ro \
      --volume dude:/dude \
      --publish 2211:2211 \
      --publish 2210:2210 \
      --publish 514:514/udp \
      --log-opt max-size=10m --log-opt max-file=5 \
      alexanderfefelov/dude

and your Dude is ready. You can stop it with

    docker stop dude

and run it again with

    docker start dude
