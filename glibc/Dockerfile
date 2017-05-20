FROM alpine:latest

ARG GLIBC_BASE_URL=https://github.com/sgerrand/alpine-pkg-glibc/releases/download
ARG GLIBC_PACKAGE_VERSION=2.25-r0
ARG GLIBC_BASE_PACKAGE=glibc-${GLIBC_PACKAGE_VERSION}.apk
ARG GLIBC_BIN_PACKAGE=glibc-bin-${GLIBC_PACKAGE_VERSION}.apk
ARG GLIBC_I18N_PACKAGE=glibc-i18n-${GLIBC_PACKAGE_VERSION}.apk
ARG GLIBC_BASE_PACKAGE_URL=${GLIBC_BASE_URL}/${GLIBC_PACKAGE_VERSION}/${GLIBC_BASE_PACKAGE}
ARG GLIBC_BIN_PACKAGE_URL=${GLIBC_BASE_URL}/${GLIBC_PACKAGE_VERSION}/${GLIBC_BIN_PACKAGE}
ARG GLIBC_I18N_PACKAGE_URL=${GLIBC_BASE_URL}/${GLIBC_PACKAGE_VERSION}/${GLIBC_I18N_PACKAGE}

RUN apk add --no-cache --virtual .build-dependencies wget curl ca-certificates && \

	#GLIBC
    wget "https://raw.githubusercontent.com/andyshinn/alpine-pkg-glibc/master/sgerrand.rsa.pub" -O "/etc/apk/keys/sgerrand.rsa.pub" && \
    wget ${GLIBC_BASE_PACKAGE_URL} && \
	wget ${GLIBC_BIN_PACKAGE_URL} && \
	wget ${GLIBC_I18N_PACKAGE_URL} && \
    apk add --no-cache ${GLIBC_BASE_PACKAGE} ${GLIBC_BIN_PACKAGE} ${GLIBC_I18N_PACKAGE} && \
    /usr/glibc-compat/bin/localedef --force --inputfile POSIX --charmap UTF-8 C.UTF-8 || true && \
    echo "export LANG=C.UTF-8" > /etc/profile.d/locale.sh && \
	apk del glibc-i18n && \
	rm -rf /root/* && \
	rm -rf ${GLIBC_BASE_PACKAGE} ${GLIBC_BIN_PACKAGE} ${GLIBC_I18N_PACKAGE} && \
	apk del .build-dependencies