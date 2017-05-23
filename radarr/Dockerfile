FROM mediainfo

RUN apk add --no-cache --virtual .build-dependencies curl wget && \
	wget -qO- $( curl -s https://api.github.com/repos/Radarr/Radarr/releases | grep linux.tar.gz | grep browser_download_url | head -1 | cut -d \" -f 4 ) | tar xvz && \
	apk del .build-dependencies

EXPOSE 7878
CMD mono /Radarr/Radarr.exe
