FROM mediainfo

RUN apk add --no-cache --virtual .build-dependencies curl wget && \
	wget -qO- http://download.sonarr.tv/v2/develop/mono/NzbDrone.develop.tar.gz | tar xvz && \
	apk del .build-dependencies
	
EXPOSE 8989
CMD mono /NzbDrone/NzbDrone.exe
