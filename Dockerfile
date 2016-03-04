# Alpine Linux with nodered
# youske/alpine-nodejs based

FROM youske/alpine-nodejs:latest
MAINTAINER youske miyakoshi <youske@gmail.com>

ENV PATH=/opt/conda/bin:$PATH \
    LANG=C.UTF-8 \
    NPM_INSTALL='node-red node-red-node-redis node-red-node-mysql node-red-contrib-github node-red-contrib-https node-red-contrib-markdown node-red-contrib-parallel-iterator node-red-contrib-cron node-red-contrib-influxdb node-red-contrib-file-upload node-red-node-youtube node-red-node-google node-red-node-aws'

RUN addgroup -S nodered && adduser -S -G nodered nodered && \
    mkdir -p /home/nodered && \
    npm install -g ${NPM_INSTALL}

COPY entrypoint.sh /docker-entrypoint.sh

EXPOSE 1880

VOLUME ["/home/nodered"]
WORKDIR /home/nodered
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["node-red"]
