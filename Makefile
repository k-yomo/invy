.DEFAULT_GOAL := help

.PHONY: generate
setup: ## Setup project
	npm install -g graphql-cli graphql-schema-utilities
	go install gotest.tools/gotestsum

.PHONY: generate
generate: ## Generate graphql code / ent code from schema
	cd invy_api && go generate ./...
	graphql-schema-utilities -s "defs/graphql/*" -o app/lib/graphql/schema.graphql
	cd app && flutter pub run build_runner build
	make fmt

.PHONY: run-dbs
run-api: run-dbs ## Run API server
	cd invy_api/cmd/server && air

.PHONY: docker-build-api
docker-build-api:  ## Build invy-api docker image
	docker build -t invy-api -f invy_api.Dockerfile .

.PHONY: push-api-dev
push-api-dev: docker-build-api  ## Build and push docker image to dev artifact registry
	docker tag invy-api asia-northeast1-docker.pkg.dev/invy-dev/invy/invy-api:latest
	docker push asia-northeast1-docker.pkg.dev/invy-dev/invy/invy-api


.PHONY: push-api-prod
push-api-prod: docker-build-api  ## Build and push docker image to dev artifact registry
	docker tag invy-api asia-northeast1-docker.pkg.dev/invy-prod/invy/invy-api:latest
	docker push asia-northeast1-docker.pkg.dev/invy-prod/invy/invy-api

.PHONY: run-app
run-app: ## Run app
	cd app && flutter run

.PHONY: run-db
run-db:
	docker-compose up -d db

.PHONY: test
test: ## Run tests
	gotestsum -- -v -race -coverprofile=coverage.out ./...

.PHONY: fmt
fmt: ## Format code
	cd invy_api &&  goimports -w . & \
	cd app && flutter format . & \
	wait

.PHONY: help
help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
