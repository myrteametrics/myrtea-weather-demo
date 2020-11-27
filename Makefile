NAMESPACE = myrtea
APP = weather-connector
GOOS ?= linux
TAG ?= demo
BUILD ?= 0
BUILD_DATE = $(shell date +%FT%T)
TARGET_ENV ?= master

APP_NAME = $(NAMESPACE)-$(APP)
ifeq ("$(TARGET_ENV)", "master")
  DOCKER_IMAGE = docker.pkg.github.com/myrteametrics/myrtea-weather-demo/$(APP_NAME):$(TAG)
else
  DOCKER_IMAGE = docker.pkg.github.com/myrteametrics/myrtea-weather-demo/$(APP_NAME):$(TAG)-$(TARGET_ENV)
endif

GO111MODULE ?= on
GOSUMDB ?= off

.PHONY: build ## Build the executable (linux by default)
build:
	GO111MODULE=$(GO111MODULE) GOSUMDB=$(GOSUMDB) CGO_ENABLED=0 GOOS=$(GOOS) go build -a -trimpath -ldflags "-X main.Version=$(TAG)-$(BUILD) -X main.BuildDate=$(BUILD_DATE)" -o bin/$(APP_NAME)

.PHONY: docker-build-local ## Build the docker image (please ensure you used "make build" before this command)
docker-build-local:
	docker build -t $(DOCKER_IMAGE) -f Dockerfile .


.PHONY: docker-push ## Push the docker image to hub.docker.com
docker-push:
	docker push $(DOCKER_IMAGE)

.PHONY: deploy
deploy: ## Run the docker-compose 
	docker-compose -f docker-compose.yml up

.PHONY: undeploy
undeploy:
	docker-compose -f docker-compose.yml down