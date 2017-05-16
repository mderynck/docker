FROM alpine:latest as builder
RUN apk add --no-cache wget
RUN wget -O - http://nzbget.net/info/nzbget-version-linux.json | \
   sed -n "s/^.*stable-download.*: \"\(.*\)\".*/\1/p" | \
   wget --no-check-certificate -i - -O nzbget-latest-bin-linux.run
RUN sh nzbget-latest-bin-linux.run

FROM alpine:latest
COPY --from=builder /nzbget /opt/nzbget
RUN rm /opt/nzbget/nzbget.conf \
	&& mkdir /opt/nzbget/config \
	&& ln -s /opt/nzbget/config/nzbget.conf /opt/nzbget/nzbget.conf \
	&& addgroup -S nzbget && adduser -S -g nzbget nzbget \
	&& chown -R nzbget.nzbget /opt/nzbget

USER nzbget

EXPOSE 6789
CMD /opt/nzbget/nzbget -s -o outputmode=log
