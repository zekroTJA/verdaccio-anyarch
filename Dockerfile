FROM node:alpine

RUN npm install --global verdaccio

RUN mkdir -p /verdaccio/conf \
    && mkdir -p /verdaccio/storage

COPY ./conf/docker.yml /verdaccio/conf/docker.yml

VOLUME /verdaccio/storage

ENV VERDACCIO_PORT=4873 \
    VERDACCIO_PROTOCOL=http

EXPOSE $VERDACCIO_PORT
CMD verdaccio --config /verdaccio/conf/docker.yml --listen $VERDACCIO_PROTOCOL://0.0.0.0:$VERDACCIO_PORT
