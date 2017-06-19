#!/bin/bash
docker run -d --name radarr --restart unless-stopped \
    -p 7878:7878 \
    -v /var/local/radarr:/root/.config/Radarr \
    -v /mnt/movies:/movies \
    -v /mnt/documentaries:/documentaries \
    -v /mnt/downloads:/downloads \
    -v /tmp:/tmp \
    radarr