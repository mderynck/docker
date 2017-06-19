FROM python

RUN apk add --no-cache git && \
	git clone https://github.com/theotherp/nzbhydra && \
	mkdir config db log && \
	apk del git

EXPOSE 5075
CMD umask 002 && python /nzbhydra/nzbhydra.py \
	--nobrowser --config /config/settings.cfg \
	--database /db/nzbhydra.db \
	--logfile /log/nzbhydra.log