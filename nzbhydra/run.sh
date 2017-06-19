#!/bin/bash
docker run -d --name pyload --restart unless-stopped \
    -p 8000:8000 \
    -v /tmp:/tmp \
    pyload