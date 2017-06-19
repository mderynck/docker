#!/bin/bash
docker run -d --name nzbget --restart unless-stopped \
    -p 6789:6789 \
    -v /mnt/docker/nzbget/config:/config \
    -v /var/log:/logs \
    -v /mnt/downloads:/downloads \
    -v /var/tmp:/incomplete \
    -v /tmp:/tmp \
    nzbget