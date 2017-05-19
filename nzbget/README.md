```sh
$ docker run -it --rm --name nzbget \
    -p 6789:6789 \
    -v /docker/nzbget/config:/config \
    -v /docker/nzbget/downloads:/downloads \
    -u $(id -u):$(id -g) \
    nzbget
```
