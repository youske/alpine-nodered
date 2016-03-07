CNAME := nodered
IMAGE_NAME = youske/alpine-${CNAME}
INSTANT_CONTAINER_NAME = instant_cont_${CNAME}

SERVICE_PORT := 8080

build: Dockerfile
	docker build --file Dockerfile --tag $(IMAGE_NAME) .

build_nocache: Dockerfile 
	docker build --no-cache --pull --file Dockerfile --tag $(IMAGE_NAME) .

run:
	docker run -it -p ${SERVICE_PORT}:1880 --rm ${IMAGE_NAME} ${ARGS}

shell:
	docker exec -it ${INSTANT_CONTAINER_NAME} /bin/bash

daemon:
	docker run -d -p ${SERVICE_PORT}:1880 ${IMAGE_NAME} ${ARGS}

push: build
	docker push ${IMAGE_NAME}:latest

notag: 
	docker rmi $(docker images | awk '/^<none>/{print $3}')
