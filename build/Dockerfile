# Alpine Linux with nodered
# youske/alpine-nodejs based

FROM youske/alpine-nodejs:latest
MAINTAINER youske miyakoshi <youske@gmail.com>

ENV PACKAGE='node-red node-red-node-redis node-red-node-mysql node-red-contrib-github node-red-contrib-https node-red-contrib-markdown node-red-contrib-parallel-iterator node-red-contrib-cron node-red-contrib-influxdb node-red-contrib-file-upload node-red-node-youtube node-red-node-google node-red-node-aws' \
    DATADIR=/nodered_data

COPY package.json /package.json
RUN addgroup -S nodered && adduser -h /home/nodered -S -G nodered nodered
RUN mkdir -p ${DATADIR} && chown -R nodered:nodered ${DATADIR}
RUN npm install -g ${PACKAGE}

EXPOSE 1880

USER nodered
WORKDIR ${DATADIR}
ENTRYPOINT ["switch","shell=/bin/bash","--","node-red"]
