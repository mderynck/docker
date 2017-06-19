#!/bin/bash
docker run -d --name sonarr --restart unless-stopped \
    -p 8989:8989 \
    -v /var/local/sonarr:/root/.config/NzbDrone \
    -v /mnt/tv:/tv \
    -v /mnt/downloads:/downloads \
    -v /tmp:/tmp \
    sonarr