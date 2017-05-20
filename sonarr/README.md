```sh
$ docker run -it --rm --name sonarr \
	-p 8989:8989 \
	-v /docker/nzbget/config:/root/.config/NzbDrone \
	-u $(id -u):$(id -g) \
	sonarr
```