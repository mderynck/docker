FROM alpine:latest as builder
RUN apk add --no-cache curl
RUN curl -L $(curl http://nzbget.net/info/nzbget-version-linux.json | sed -n "s/^.*stable-download.*: \"\(.*\)\".*/\1/p") > nzbget.run && \
	sh nzbget.run

FROM alpine:latest
WORKDIR /opt/nzbget
COPY --from=builder /nzbget .
RUN rm nzbget.conf && \
	mkdir /config /downloads && \
	ln -s /config/nzbget.conf nzbget.conf && \
	ln -s /downloads downloads

EXPOSE 6789
CMD /opt/nzbget/nzbget -s -o outputmode=log
