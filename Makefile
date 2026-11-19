.PHONY: help lint docker-build compose-up compose-down kind-up kind-down k8s-basics helm-template

help: ## Show available commands
	@grep -E '^[a-zA-Z_-]+:.*## ' $(MAKEFILE_LIST) | awk -F':.*## ' '{printf "  %-16s %s\n", $$1, $$2}'

lint: ## Run the same checks as CI (helm, terraform fmt, ansible syntax, YAML)
	helm lint helm/01-chart-structure/my-web-app
	terraform fmt -check -recursive terraform/
	cd ansible && for p in playbooks/*.yml; do ansible-playbook --syntax-check -i inventories/hosts.ini $$p; done
	yamllint -c .yamllint.yml kubernetes ansible gitops observability

docker-build: ## Build the three sample app images
	docker build -t sample-node   -f docker/01-dockerfiles/Dockerfile.node   docker/00-sample-apps/node
	docker build -t sample-go     -f docker/01-dockerfiles/Dockerfile.golang docker/00-sample-apps/go
	docker build -t sample-python -f docker/01-dockerfiles/Dockerfile.python docker/00-sample-apps/python

compose-up: ## Start the compose stack (http://localhost:8081)
	cd docker/02-compose && docker compose up -d

compose-down: ## Stop the compose stack and delete its volumes
	cd docker/02-compose && docker compose down -v

kind-up: ## Create a local Kubernetes cluster with kind
	kind create cluster --name iac-learning

kind-down: ## Delete the local kind cluster
	kind delete cluster --name iac-learning

k8s-basics: ## Apply the Kubernetes basics manifests
	kubectl apply -f kubernetes/01-basics/

helm-template: ## Render the Helm chart with prod values (no cluster needed)
	helm template demo helm/01-chart-structure/my-web-app -f helm/02-environments/values-prod.yaml
