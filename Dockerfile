FROM dockette/alpine:3.6

MAINTAINER Matej Sychra <suculent@me.com>

ENV OWNER_ID cedc16bb6bb06daaa3ff6d30666d91aacd6e3efbf9abbc151b4dcade59af7c12
ENV API_KEY a854724bc000e030b588370ad8cf31aa95faaf18f33685afa6624c830b920063
ENV DEVICE_ALIAS vanilla

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
