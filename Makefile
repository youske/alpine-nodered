IMAGE_NAME := youske/alpine-nodered
SERVICE_PORT := 8080

build: Dockerfile
	docker build --file Dockerfile --tag $(IMAGE_NAME) .

build_nocache: Dockerfile 
	docker build --no-cache --pull --file Dockerfile --tag $(IMAGE_NAME) .

run:
	docker run -it -p ${SERVICE_PORT}:1880 --rm ${IMAGE_NAME} ${ARGS}

daemon:
	docker run -d -p ${SERVICE_PORT}:1880 ${IMAGE_NAME} ${ARGS}

push: build
	docker push ${IMAGE_NAME}:latest

notag: 
	docker rmi $(docker images | awk '/^<none>/{print $3}')
