```sh
$ docker run -it --rm --name radarr \
	-p 8989:8989 \
	-v /docker/radarr/config:/root/.config/NzbDrone \
	-u $(id -u):$(id -g) \
	sonarr
```