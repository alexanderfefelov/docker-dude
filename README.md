# docker-dude

[![Docker Pulls](https://img.shields.io/docker/pulls/alexanderfefelov/dude.svg)](https://hub.docker.com/r/alexanderfefelov/dude)
[![Docker Stars](https://img.shields.io/docker/stars/alexanderfefelov/dude.svg)](https://hub.docker.com/r/alexanderfefelov/dude)
[![](https://images.microbadger.com/badges/version/alexanderfefelov/dude.svg)](https://microbadger.com/images/alexanderfefelov/dude)
[![](https://images.microbadger.com/badges/image/alexanderfefelov/dude.svg)](https://microbadger.com/images/alexanderfefelov/dude)

```
Attention! This is a server container, not a client!

Last version of The Dude server for Windows is 4.0beta3 released in 2011.

```

Just type

```bash
docker run \
  --name dude \
  --detach \
  --restart unless-stopped \
  --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
  --volume dude:/dude/data \
  --publish 80:80 \
  --publish 443:443 \
  --publish 514:514/udp \
  --publish 2210:2210 \
  --publish 2211:2211 \
  --health-cmd /healthcheck.sh --health-start-period 3s --health-interval 1m --health-timeout 1s --health-retries 3 \
  --log-opt max-size=10m --log-opt max-file=5 \
  alexanderfefelov/dude
```

and your Dude is ready.

Ports published:

| Port | Description
| ---: | -----------
| 80 | HTTP
| 443 | HTTPS
| 514/udp | Syslog
| 2210 | Insecure Dude
| 2211 | Secure Dude

You can stop your Dude with

```bash
docker stop dude
```

and run it again with

```bash
docker start dude
```

## Where is my data?

```bash
docker volume inspect --format '{{ .Mountpoint }}' dude
```

## Uninstall

```bash
docker rm --force dude
docker image rm alexanderfefelov/dude
docker volume rm dude
```
