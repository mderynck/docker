```sh
$ docker run -it --rm --name sonarr \
	-p 8989:8989 \
	-v /docker/sonarr/config:/root/.config/NzbDrone \
	-u $(id -u):$(id -g) \
	sonarr
```