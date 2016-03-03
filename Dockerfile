# Alpine Linux with nodered
# youske/alpine-nodejs based
FROM youske/alpine-nodejs:v1
MAINTAINER youske miyakoshi <youske@gmail.com>
ENV PATH=/opt/conda/bin:$PATH \
    LANG=C.UTF-8 \
    APKINSTALL='bash wget nodejs libstdc++'
RUN npm install -g node-red && \
    echo "nodered install"
VOLUME ["/home/user"]
WORKDIR /home/user
EXPOSE 1880
