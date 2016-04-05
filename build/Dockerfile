# Alpine Linux with nodered
# youske/alpine-nodejs based

FROM youske/alpine-nodejs:latest
MAINTAINER youske miyakoshi <youske@gmail.com>

ENV PATH=$PATH \
    LANG=C.UTF-8 \
    NPM_INSTALL='node-red node-red-node-redis node-red-node-mysql node-red-contrib-github node-red-contrib-https node-red-contrib-markdown node-red-contrib-parallel-iterator node-red-contrib-cron node-red-contrib-influxdb node-red-contrib-file-upload node-red-node-youtube node-red-node-google node-red-node-aws'

COPY package.json /package.json
RUN addgroup -S nodered && adduser -h /home/nodered -S -G nodered nodered
RUN mkdir -p /nodered_data
RUN npm install -g ${NPM_INSTALL}
#RUN npm install -g
EXPOSE 1880
WORKDIR /home/nodered
ENTRYPOINT ["switch","shell=/bin/bash","--","node-red"]
