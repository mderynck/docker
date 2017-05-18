FROM alpine:latest as builder
RUN apk add --no-cache wget
RUN wget -qO- http://update.sonarr.tv/v2/master/mono/NzbDrone.master.tar.gz | tar xvz

FROM alpine:latest
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing mono libmediainfo sqlite
WORKDIR /opt/sonarr
COPY --from=builder /NzbDrone .

EXPOSE 8989
CMD mono /opt/sonarr/NzbDrone.exe
