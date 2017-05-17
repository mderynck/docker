FROM alpine:latest as builder
RUN apk add --no-cache wget
RUN wget -O - http://nzbget.net/info/nzbget-version-linux.json | \
   sed -n "s/^.*stable-download.*: \"\(.*\)\".*/\1/p" | \
   wget --no-check-certificate -i - -O nzbget-latest-bin-linux.run
RUN sh nzbget-latest-bin-linux.run

FROM alpine:latest
WORKDIR /opt/nzbget
COPY --from=builder /nzbget .
RUN rm nzbget.conf \
	&& mkdir config \
	&& ln -s config/nzbget.conf nzbget.conf

USER nzbget

EXPOSE 6789
CMD /opt/nzbget/nzbget -s -o outputmode=log
