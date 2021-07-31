SHELL := /bin/bash
IMAGE_TAG?=$(shell git rev-parse --short HEAD)

.PHONY: build
build: clean
	$(info Make: Building docker images: TAG=${IMAGE_TAG})
	@TAG=${IMAGE_TAG} docker-compose -f docker-compose.yml build --no-cache

.PHONY: push
push: build
	$(info Make: Building docker images: TAG=${IMAGE_TAG})
	@TAG=${IMAGE_TAG} docker-compose -f docker-compose.yml push

.PHONY: clean
clean:
	$(info Make: Clean docker containers)
	docker-compose down -v --remove-orphans
	@TAG=${IMAGE_TAG} docker rmi -f summarizer:${IMAGE_TAG}

.PHONY: run
run: clean
	$(info Make: Bring local docker cluster up)
	@TAG=${IMAGE_TAG} docker-compose -f docker-compose.yml up
