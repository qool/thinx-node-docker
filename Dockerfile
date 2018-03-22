FROM dockette/alpine:3.6

MAINTAINER Matej Sychra <suculent@me.com>

RUN apk update && apk upgrade && \
    apk add nodejs-current-npm git && \
    npm --silent install --global --depth 0 pnpm && \
    rm -rf /var/cache/apk/*

RUN git clone https://github.com/suculent/thinx-firmware-js && \
    cd /thinx-firmware-js && \
    pwd && ls -la  && \
    npm install . && \
    rm -rf /thinx-firmware-js/conf/config.json && \
    ls -la && pwd

ADD ./config.json /thinx-firmware-js/conf/config.json

CMD cd /thinx-firmware-js && \
    ls -la && \
    node index.js
