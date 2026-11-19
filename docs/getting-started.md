# Getting Started (about 30 minutes)

## Prerequisites
- A terminal (Linux, macOS, or Windows with WSL2) and basic command-line comfort (`cd`, `ls`, editing files).
- Git, and the ability to read YAML (indentation matters; use spaces, never tabs).
- Docker. Optional but recommended: a free local Kubernetes tool (kind or minikube).
- **No cloud account needed** until Terraform modules - `terraform/01-basics` only creates local files.

## Learning order
Docker -> Kubernetes -> Helm -> CI/CD -> GitOps -> Observability.
**Ansible and Terraform are independent** of the Kubernetes track; learn them in parallel or after.

## Your first 5 steps
```bash
git clone https://github.com/Amanbig/infrastructure-as-code.git && cd infrastructure-as-code

# 1. Build and run a container
make docker-build
docker run --rm -p 3000:3000 sample-node        # open http://localhost:3000

# 2. Run a multi-service stack
make compose-up                                 # open http://localhost:8081
make compose-down

# 3. Create a local cluster and deploy something
make kind-up
make k8s-basics
kubectl get pods

# 4. Render a Helm chart (no cluster needed)
make helm-template

# 5. Terraform with zero cloud cost
cd terraform/01-basics && terraform init && terraform plan
```
Run `make help` to see every shortcut. When finished: `make kind-down` and see
[troubleshooting-and-cleanup.md](troubleshooting-and-cleanup.md).

## Exercises
1. Change the message in `docker/00-sample-apps/node/src/main.js`, rebuild, and see it change.
2. Scale `kubernetes/01-basics/04-deployment.yaml` to 5 replicas and re-apply. Delete a pod and watch it come back.
3. Compare `make helm-template` output using `values-dev.yaml` vs `values-prod.yaml`.
4. Break a Terraform variable validation on purpose and read the error.
