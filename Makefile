NAME    := frapsoft/atop
TAG     := latest
CHECKSUM=$(shell cat * | md5sum | cut -c1-8)

all: container push	 
container:
	docker build -t ${NAME}:${TAG} .
push:
	@echo "The CHECKSUM of all files in this folder is ${CHECKSUM}."
	@echo "Pushing to Docker Hub..."
	docker tag ${NAME}:${TAG} ${NAME}:${TAG}_${CHECKSUM}
	docker push ${NAME}:${TAG}_${CHECKSUM}
	docker push ${NAME}:${TAG}
