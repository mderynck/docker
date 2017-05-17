```sh
$ docker run -it --rm --name nzbget \
    -p 6789:6789 \
    -v /docker/nzbget/config:/opt/nzbget/config \
    -v /docker/nzbget/downloads:/opt/nzbget/downloads \
    -u $(id -u):$(id -g) \
    nzbget
```
