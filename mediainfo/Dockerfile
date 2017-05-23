FROM mono

ARG MEDIAINFO_VERSION=0.7.95

RUN apk add --no-cache --virtual .build-dependencies wget ca-certificates tar xz make g++ gcc git && \
	apk add --no-cache sqlite-libs unrar zlib zlib-dev && \
	
	#MEDIAINFO
	wget -qO- https://mediaarea.net/download/binary/mediainfo/${MEDIAINFO_VERSION}/MediaInfo_CLI_${MEDIAINFO_VERSION}_GNU_FromSource.tar.gz | tar xvz && \
	wget -qO- https://mediaarea.net/download/binary/libmediainfo0/${MEDIAINFO_VERSION}/MediaInfo_DLL_${MEDIAINFO_VERSION}_GNU_FromSource.tar.gz | tar xvz &&\
	cd /MediaInfo_CLI_GNU_FromSource && ./CLI_Compile.sh && \
	cd /MediaInfo_CLI_GNU_FromSource/MediaInfo/Project/GNU/CLI/ && make install && \
	cd /MediaInfo_DLL_GNU_FromSource && ./SO_Compile.sh && \
	cd /MediaInfo_DLL_GNU_FromSource/MediaInfoLib/Project/GNU/Library && make install && \
	cd /MediaInfo_DLL_GNU_FromSource/ZenLib/Project/GNU/Library && make install && \
	rm -rf /MediaInfo_CLI_GNU_FromSource && \
	rm -rf /MediaInfo_DLL_GNU_FromSource && \
	apk del .build-dependencies
