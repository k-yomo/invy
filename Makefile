.DEFAULT_GOAL := help

.PHONY: generate
generate: ## Generate graphql code / ent code from schema
	cd bump_api && go generate ./... & \
#	cd frontend && npm run codegen & \
	wait
	make fmt

.PHONY: run
run: run-dbs ## Run servers
	goreman -set-ports=false start

.PHONY: run-dbs
run-dbs:
	docker-compose up -d db redis

.PHONY: fmt
fmt: ## Format code
	cd bump_api &&  goimports -w . & \
#	cd app && fmt & \
	wait

.PHONY: help
help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
