#!/bin/bash
docker run -d --name nzbhydra --restart unless-stopped \
    -p 5075:5075 \
    -v /mnt/docker/nzbhydra/config:/config \
    -v /var/local/nzbhydra:/db \
    -v /var/log:/log \
    -v /tmp:/tmp \
    nzbhydra