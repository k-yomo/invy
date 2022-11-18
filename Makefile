.DEFAULT_GOAL := help

.PHONY: generate
setup: ## Setup project
	npm install -g graphql-cli graphql-schema-utilities

.PHONY: generate
generate: ## Generate graphql code / ent code from schema
	cd invy_api && go generate ./...
	graphql-schema-utilities -s "defs/graphql/*" -o app/lib/graphql/schema.graphql
	cd app && flutter pub run build_runner build
	make fmt

.PHONY: run-dbs
run-api: run-dbs ## Run API server
	cd invy_api/cmd/server && air

.PHONY: run-app
run-app: ## Run app
	cd app && flutter run

.PHONY: run-db
run-db:
	docker-compose up -d db

.PHONY: fmt
fmt: ## Format code
	cd invy_api &&  goimports -w . & \
	cd app && flutter format . & \
	wait

.PHONY: help
help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
