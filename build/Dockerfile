# Alpine Linux with nodered
# youske/alpine-nodejs based

FROM youske/alpine-nodejs:latest
MAINTAINER youske miyakoshi <youske@gmail.com>

ENV PORT=1880 \
    NODERED_USER=nodered \
    NODERED_HOME=/home/nodered

ENV BUILD_PACKAGE='wget git build-base musl-dev linux-headers python-dev nodejs-dev' \
    WORKDIR=${NODERED_HOME}/data

RUN apk update --no-cache && apk add ${BUILD_PACKAGE} --no-cache -t buildpack

RUN addgroup -S ${NODERED_USER} && adduser -h ${NODERED_HOME} -S -G ${NODERED_USER} ${NODERED_USER}

USER ${NODERED_USER}

COPY package.json ${NODERED_HOME}/package.json
RUN cd ${NODERED_HOME} && \
#    npm install && \
    mkdir -p ${WORKDIR} && chown -R ${NODERED_USER}:${NODERED_USER} ${WORKDIR}

EXPOSE ${PORT}

WORKDIR ${WORKDIR}
ENTRYPOINT ["switch","shell=/bin/bash","--","node-red"]
