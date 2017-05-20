FROM glibc

RUN apk add --no-cache --virtual .build-dependencies wget ca-certificates tar xz && \
    wget -qO- "https://www.archlinux.org/packages/extra/x86_64/mono/download/" | tar xJ && \
    cert-sync /etc/ssl/certs/ca-certificates.crt && \
    apk del .build-dependencies
