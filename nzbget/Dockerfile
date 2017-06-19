FROM alpine:latest as builder
RUN apk add --no-cache curl
RUN curl -L https://github.com/nzbget/nzbget/releases/download/v18.1/nzbget-18.1-bin-linux.run > nzbget.run && \
	sh nzbget.run

FROM alpine:latest
WORKDIR /opt/nzbget
COPY --from=builder /nzbget .
RUN rm /opt/nzbget/nzbget.conf && \
	mkdir /config /downloads /incomplete /logs && \
	ln -s /config/nzbget.conf /opt/nzbget/nzbget.conf

EXPOSE 6789
CMD umask 002 && /opt/nzbget/nzbget -s -o outputmode=log
