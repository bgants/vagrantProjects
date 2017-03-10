
#Run some container and give me the shell.
docker run -it ubuntu:latest /bin/bash

#Gets rid of stopped docker containers.
docker rm -v $(docker ps -aq -f status=exited)

#Remove all the images on a system.
docker rmi $(docker images -q)

#Remove all untagged images.
docker rmi $(docker images -q -f dangling=true)
