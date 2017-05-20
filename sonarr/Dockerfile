FROM alpine:latest as builder

ARG GLIBC_BASE_URL=https://github.com/sgerrand/alpine-pkg-glibc/releases/download
ARG GLIBC_PACKAGE_VERSION=2.25-r0
ARG GLIBC_BASE_PACKAGE=glibc-${GLIBC_PACKAGE_VERSION}.apk
ARG GLIBC_BIN_PACKAGE=glibc-bin-${GLIBC_PACKAGE_VERSION}.apk
ARG GLIBC_I18N_PACKAGE=glibc-i18n-${GLIBC_PACKAGE_VERSION}.apk
ARG GLIBC_BASE_PACKAGE_URL=${GLIBC_BASE_URL}/${GLIBC_PACKAGE_VERSION}/${GLIBC_BASE_PACKAGE}
ARG GLIBC_BIN_PACKAGE_URL=${GLIBC_BASE_URL}/${GLIBC_PACKAGE_VERSION}/${GLIBC_BIN_PACKAGE}
ARG GLIBC_I18N_PACKAGE_URL=${GLIBC_BASE_URL}/${GLIBC_PACKAGE_VERSION}/${GLIBC_I18N_PACKAGE}

RUN apk add --no-cache wget ca-certificates && \
    wget "https://raw.githubusercontent.com/andyshinn/alpine-pkg-glibc/master/sgerrand.rsa.pub" -O "/etc/apk/keys/sgerrand.rsa.pub" && \
    wget ${GLIBC_BASE_PACKAGE_URL} && \
	wget ${GLIBC_BIN_PACKAGE_URL} && \
	wget ${GLIBC_I18N_PACKAGE_URL} && \
    apk add --no-cache ${GLIBC_BASE_PACKAGE} ${GLIBC_BIN_PACKAGE} ${GLIBC_I18N_PACKAGE} && \
    /usr/glibc-compat/bin/localedef --force --inputfile POSIX --charmap UTF-8 C.UTF-8 || true && \
    echo "export LANG=C.UTF-8" > /etc/profile.d/locale.sh && \
    apk del glibc-i18n

ENV LANG=C.UTF-8

RUN apk add --no-cache tar xz && \
	wget "https://www.archlinux.org/packages/extra/x86_64/mono/download/" -O "/tmp/mono.pkg.tar.xz" && \
    tar -xJf "/tmp/mono.pkg.tar.xz" && \
    cert-sync /etc/ssl/certs/ca-certificates.crt

ARG MEDIAINFO_VERSION=0.7.95
	
RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
	apk add --no-cache curl ca-certificates make g++ gcc git sqlite sqlite-libs xz unrar zlib zlib-dev && \
	curl https://mediaarea.net/download/binary/mediainfo/0.7.95/MediaInfo_CLI_${MEDIAINFO_VERSION}_GNU_FromSource.tar.gz | tar xvz && \
	curl https://mediaarea.net/download/binary/libmediainfo0/0.7.95/MediaInfo_DLL_${MEDIAINFO_VERSION}_GNU_FromSource.tar.gz | tar xvz && \
	curl http://download.sonarr.tv/v2/develop/mono/NzbDrone.develop.tar.gz | tar xvz && \
	cd /MediaInfo_CLI_GNU_FromSource && ./CLI_Compile.sh && \
	cd /MediaInfo_CLI_GNU_FromSource/MediaInfo/Project/GNU/CLI/ && make install && \
	cd /MediaInfo_DLL_GNU_FromSource && ./SO_Compile.sh && \
	cd /MediaInfo_DLL_GNU_FromSource/MediaInfoLib/Project/GNU/Library && make install && \
	cd /MediaInfo_DLL_GNU_FromSource/ZenLib/Project/GNU/Library && make install && \
	ln -s /usr/local/lib/libmediainfo.so.0 /NzbDrone/libmediainfo.so.0 && \
	ln -s /usr/local/lib/libmediainfo.so.0 /NzbDrone/libmediainfo.so.0.so
	
EXPOSE 8989
CMD mono /opt/sonarr/NzbDrone.exe