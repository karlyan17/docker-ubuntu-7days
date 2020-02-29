DOCKER_ORG:=ubuntu
DOCKER_IMAGE:=7days

build: package
	docker build -t $(DOCKER_ORG)/$(DOCKER_IMAGE) .

.PHONY: package
