# docker-dude

Just type

    docker run --name dude --privileged --detach --volume /etc/localtime:/etc/localtime:ro --publish 2211:2211 --publish 2210:2210 alexanderfefelov/dude

and your Dude is ready. You can stop it with

    docker stop dude

and run it again with

    docker start dude
