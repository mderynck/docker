FROM python

RUN apk add --no-cache git && \
	git clone https://github.com/theotherp/nzbhydra && \
	mkdir /nzbhydra/config && \
	apk del git
	
CMD python /nzbhydra/nzbhydra.py \
	--nobrowser --config /config/settings.cfg \
	--database /config/nzbhydra.db \
	--logfile /log/nzbhydra.log