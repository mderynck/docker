```sh
$ docker run -it --rm --name dnsmasq \
	--cap-add=NET_ADMIN \
	--net=host \
	-v /docker/dnsmasq/config:/etc/dnsmasq \
	-u $(id -u):$(id -g) \
	dnsmasq
```