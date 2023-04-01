.DEFAULT_GOAL := help

GOPATH := $(shell go env GOPATH)
GOBIN := $(PWD)/bin

PATH := $(GOBIN):$(PATH)
SHELL := env "PATH=$(PATH)" bash

GIT_REF := $(shell git rev-parse --short=7 HEAD)
VERSION ?= commit-$(GIT_REF)

GAR_PROJECT ?= invy-dev
GAR_REGISTRY := asia-northeast1-docker.pkg.dev/$(GAR_PROJECT)
IMAGE_PATH := $(GAR_REGISTRY)/invy/invy-api
IMAGE := $(IMAGE_PATH):$(VERSION)
IMAGE_LATEST := $(IMAGE_PATH):latest

.PHONY: setup
setup: ## Setup project
	GOBIN=${GOBIN} ./scripts/install-tools.sh
	npm install -g graphql-cli graphql-schema-utilities

.PHONY: generate
generate: ## Generate graphql code / ent code from schema
	cd invy_api && go generate ./...
	@graphql-schema-utilities -s "defs/graphql/*" -o app/lib/graphql/schema.graphql
	cd app && flutter pub run build_runner build --delete-conflicting-outputs
	make fmt

.PHONY: run-dbs
run-api: run-dbs ## Run API server
	cd invy_api && air

.PHONY: docker-build-api
docker-build-api:  ## Build invy-api docker image
	docker build -t invy-api -t $(IMAGE) -t $(IMAGE_LATEST) -f invy_api.Dockerfile .

.PHONY: push-api-dev
push-api-image: docker-build-api  ## Build and push docker image to dev artifact registry
	docker tag invy-api $(IMAGE)
	docker tag invy-api $(IMAGE_LATEST)
	docker push $(IMAGE_PATH)

.PHONY: run-app
run-app: ## Run app
	cd app && flutter run --dart-define=FLAVOR=local --dart-define=GOOGLE_API_KEY=AIzaSyC5-1sT3hduoMlGnrBTVTaQo-Al0GpRC_Q

.PHONY: run-app-dev
run-app-dev: ## Run app with connecting to dev env
	cd app && flutter run --dart-define=FLAVOR=dev --dart-define=GOOGLE_API_KEY=AIzaSyC5-1sT3hduoMlGnrBTVTaQo-Al0GpRC_Q

.PHONY: run-db
run-db:
	docker-compose up -d db

.PHONY: connect-db
connect-db:
	PGPASSWORD=password psql -h 127.0.0.1 -p 15432 --user postgres -d invy

.PHONY: test-api
test-api: ## Run tests
	gotestsum -- -v -race -coverprofile=coverage.out ./...

.PHONY: fmt
fmt: ## Format code
	cd invy_api &&  goimports -w . & \
	cd app && dart format . & \
	wait

.PHONY: lint
lint: ## Run linter
	cd app && dart fix --apply . & \
	wait

.PHONY: help
help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
