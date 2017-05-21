```sh
$ docker run -it --rm --name nzbhydra \
    -p 5075:5075 \
    -v /docker/nzbhydra/config:/config \
    -v /docker/nzbhydra/logs:/logs \
    -u $(id -u):$(id -g) \
    nzbhydra
```
