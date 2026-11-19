# 🚀 Infrastructure as Code (IaC) & Cloud Native Learning Hub

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Docker](https://img.shields.io/badge/Docker-recommended_24+-2496ED?logo=docker&logoColor=white)](https://www.docker.com/)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-recommended_1.28+-326CE5?logo=kubernetes&logoColor=white)](https://kubernetes.io/)
[![Helm](https://img.shields.io/badge/Helm-recommended_3+-0F1689?logo=helm&logoColor=white)](https://helm.sh/)
[![Ansible](https://img.shields.io/badge/Ansible-recommended_2.15+-EE0000?logo=ansible&logoColor=white)](https://www.ansible.com/)
[![Terraform](https://img.shields.io/badge/Terraform-recommended_1.5+-844FBA?logo=terraform&logoColor=white)](https://www.terraform.io/)
[![ArgoCD](https://img.shields.io/badge/ArgoCD-recommended_2.9+-EF7B4D?logo=argo&logoColor=white)](https://argo-cd.readthedocs.io/)
[![Prometheus](https://img.shields.io/badge/Prometheus-recommended_2.45+-E6522C?logo=prometheus&logoColor=white)](https://prometheus.io/)

Welcome to the **Infrastructure as Code (IaC) & Cloud Native Learning Hub**! This repository is designed from the ground up as a hands-on, beginner-to-advanced learning resource. Whether you are stepping into DevOps for the first time or want clean reference examples, you will find modular, heavily commented configs here. The examples are written to **teach**; they follow good practices, but review and harden them before using anything in real production.

---

## 📚 Table of Contents

- [🏁 Start Here (Beginners)](#-start-here-beginners)
- [📖 Glossary & Extra Docs](#-glossary--extra-docs)
- [🗺️ Complete DevOps & IaC Learning Roadmap](#️-complete-devops--iac-learning-roadmap)
- [⚖️ Tool Comparison Matrix](#️-tool-comparison-matrix)
- [📁 Repository Structure & Direct File Links](#-repository-structure--direct-file-links)
  - [🐳 1. Docker & Containerization](#-1-docker--containerization)
  - [☸️ 2. Kubernetes (K8s)](#️-2-kubernetes-k8s)
  - [⎈ 3. Helm Charts](#-3-helm-charts)
  - [📜 4. Ansible Configuration Management](#-4-ansible-configuration-management)
  - [🌍 5. HashiCorp Terraform](#-5-hashicorp-terraform)
  - [🔄 6. CI/CD Automation](#-6-cicd-automation)
  - [🐙 7. GitOps with ArgoCD](#-7-gitops-with-argocd)
  - [📊 8. Observability & Monitoring](#-8-observability--monitoring)
  - [📦 9. Packer: Machine Images](#-9-packer-machine-images)
  - [🔐 10. Vault: Secrets Management](#-10-vault-secrets-management)
  - [🧩 11. Pulumi: IaC in Real Code](#-11-pulumi-iac-in-real-code)
- [🛠️ Tool Installation & Setup Guides](#️-tool-installation--setup-guides)
- [🔒 Security & Production Best Practices](#-security--production-best-practices)
- [🎓 Recommended Certifications & Career Paths](#-recommended-certifications--career-paths)
- [🤝 Contributing & License](#-contributing--license)

---

## 🏁 Start Here (Beginners)

**New to all of this? Read this section first.**

### What you need
- A terminal (Linux, macOS, or Windows with [WSL2](https://learn.microsoft.com/windows/wsl/install)), Git, and a text editor.
- Basic command-line skills and comfort reading YAML (indent with spaces, never tabs).
- **No cloud account is needed** to start. Docker, Kubernetes (via kind), Helm, Ansible syntax checks and `terraform/01-basics` all run locally for free.

> ⚠️ **Cost warning:** the Terraform examples in `02-modules` and `03-environments` create **real AWS resources** that can cost money. Always `terraform plan` first and `terraform destroy` afterwards.

### Your first 5 steps
```bash
git clone https://github.com/Amanbig/infrastructure-as-code.git && cd infrastructure-as-code
make help            # list all shortcuts

make docker-build    # 1. build the sample apps  ->  docker run --rm -p 3000:3000 sample-node
make compose-up      # 2. run a multi-service stack at http://localhost:8081  (make compose-down to stop)
make kind-up         # 3. create a local Kubernetes cluster (needs kind)
make k8s-basics      #    deploy the basics: kubectl get pods
make helm-template   # 4. render the Helm chart, no cluster needed
cd terraform/01-basics && terraform init && terraform plan   # 5. Terraform, zero cost
```
More detail and exercises: [docs/getting-started.md](docs/getting-started.md). Something broke or want to clean up? See [docs/troubleshooting-and-cleanup.md](docs/troubleshooting-and-cleanup.md).

### Which order should I learn in?
Docker, then Kubernetes, Helm, CI/CD, GitOps and Observability form one track. **Ansible, Terraform (and its alternative Pulumi), Packer and Vault are independent** of that track: learn them in parallel or whenever you like. The roadmap below is a suggested path, not a strict dependency chain.

---

## 📖 Glossary & Extra Docs
- [Glossary](docs/glossary.md): idempotent, drift, reconciliation, TSDB and other jargon in plain English.
- [Getting started](docs/getting-started.md) · [Troubleshooting & cleanup](docs/troubleshooting-and-cleanup.md)
- [Sample apps](docker/00-sample-apps/README.md): tiny Node/Go/Python apps so every Dockerfile actually builds.

---

## 🗺️ Complete DevOps & IaC Learning Roadmap

Follow this step-by-step path from source code to automated production delivery:

```
┌────────────────────────────────────────────────────────────────────────┐
│                        Step 1: Containerization                        │
│                                [ Docker ]                              │
│         Multi-Stage Builds ➔ Minimal Images ➔ Compose Stacks           │
└───────────────────────────────────┬────────────────────────────────────┘
                                    │
                                    ▼
┌────────────────────────────────────────────────────────────────────────┐
│                        Step 2: Container Orchestration                 │
│                            [ Kubernetes (K8s) ]                        │
│   Pods ➔ Deployments ➔ Services ➔ Ingress ➔ Volumes ➔ RBAC ➔ Autoscaling │
└───────────────────────────────────┬────────────────────────────────────┘
                                    │
                                    ▼
┌────────────────────────────────────────────────────────────────────────┐
│                        Step 3: Kubernetes Packaging                    │
│                                 [ Helm ]                               │
│        Templates ➔ values.yaml ➔ Chart Releases ➔ Multi-Environment    │
└───────────────────────────────────┬────────────────────────────────────┘
                                    │
                                    ▼
┌────────────────────────────────────────────────────────────────────────┐
│                     Step 4: Configuration Management                   │
│                               [ Ansible ]                              │
│       Agentless SSH ➔ Inventories ➔ Idempotent Playbooks ➔ Roles       │
└───────────────────────────────────┬────────────────────────────────────┘
                                    │
                                    ▼
┌────────────────────────────────────────────────────────────────────────┐
│                    Step 5: Cloud Infrastructure as Code                │
│                              [ Terraform ]                             │
│     HCL Syntax ➔ Plan & Apply ➔ Reusable Modules ➔ State Locking       │
└───────────────────────────────────┬────────────────────────────────────┘
                                    │
                                    ▼
┌────────────────────────────────────────────────────────────────────────┐
│                      Step 6: Continuous Integration                    │
│                                [ CI/CD ]                               │
│        Automated Linting ➔ Unit Tests ➔ Trivy Vulnerability Scans      │
└───────────────────────────────────┬────────────────────────────────────┘
                                    │
                                    ▼
┌────────────────────────────────────────────────────────────────────────┐
│                       Step 7: Declarative Delivery                     │
│                           [ GitOps (ArgoCD) ]                          │
│     Pull-based Sync ➔ Drift Detection ➔ Multi-Env ApplicationSets      │
└───────────────────────────────────┬────────────────────────────────────┘
                                    │
                                    ▼
┌────────────────────────────────────────────────────────────────────────┐
│                     Step 8: Feedback & Reliability                     │
│                     [ Observability (Prom/Grafana) ]                   │
│        Prometheus Metrics ➔ Alert Rules ➔ Visual Dashboards            │
└────────────────────────────────────────────────────────────────────────┘
```

---

## ⚖️ Tool Comparison Matrix

| Tool | Primary Purpose | How It Works | Agent Needed? | State Management |
| :--- | :--- | :--- | :--- | :--- |
| **[Docker](docker/README.md)** | Application packaging & runtime | Container engine leveraging Linux cgroups/namespaces | Yes (`dockerd`) | Container images stored locally / registry |
| **[Kubernetes](kubernetes/README.md)** | Cluster container orchestration | Declarative YAML desired-state reconciliation loop | Yes (`kubelet` on worker nodes) | Persistent cluster state in `etcd` |
| **[Helm](helm/README.md)** | Kubernetes package manager | Parameterized Go templates with `values.yaml` | No (Client-side CLI) | Stored as Kubernetes Secrets inside cluster |
| **[Ansible](ansible/README.md)** | Server configuration & OS automation | Push-based idempotent tasks via SSH / WinRM | **No** (Purely agentless) | Stateless (Queries current machine state live) |
| **[Terraform](terraform/README.md)** | Cloud infrastructure provisioning | Declarative HCL orchestrating cloud APIs | No (Calls cloud REST APIs) | Stateful (`terraform.tfstate` local or remote S3) |
| **[CI/CD](cicd/README.md)** | Automated test, scan & build pipelines | Pipeline runners executing job workflows | Yes (Runner agent) | Ephemeral / Artifact caches |
| **[GitOps](gitops/README.md)** | Pull-based cluster synchronization | In-cluster reconciler matching live state to Git | Yes (ArgoCD in-cluster controllers) | Uses Git commit tree as single source of truth |
| **[Observability](observability/README.md)**| Metrics, alerting & telemetry | Metric scrapers pulling endpoints + TSDB | Yes (Node exporters & Prometheus) | Time-series database (TSDB) |
| **[Pulumi](pulumi/README.md)** | Cloud infrastructure provisioning (in Python/TS/Go) | Declarative resources written in real programming languages | No (Calls cloud APIs) | Stateful (Pulumi Cloud, local, or S3 backend) |
| **[Packer](packer/README.md)** | Building machine/container images | Declarative HCL: source ➔ provisioners ➔ image | No | Stateless (produces image artifacts) |
| **[Vault](vault/README.md)** | Secrets management | API server with policies, encryption, and audit logs | Yes (Vault server) | Encrypted storage backend |

---

## 📁 Repository Structure & Direct File Links

### 🐳 1. [Docker & Containerization](docker/README.md)
- [00-sample-apps/](docker/00-sample-apps/README.md) - Tiny Node, Go, and Python apps used as build contexts.
- [Dockerfile.node](docker/01-dockerfiles/Dockerfile.node) - Multi-stage Node.js build with non-root user.
- [Dockerfile.golang](docker/01-dockerfiles/Dockerfile.golang) - Ultra-minimal statically compiled Go binary on `scratch`.
- [Dockerfile.python](docker/01-dockerfiles/Dockerfile.python) - Hardened Python multi-stage build using virtualenvs.
- [.dockerignore](docker/01-dockerfiles/.dockerignore) - Exclusion rules preventing large or sensitive files in builds.
- [docker-compose.yml](docker/02-compose/docker-compose.yml) - Multi-service local stack (Nginx, App, PostgreSQL, Redis).
- [nginx.conf](docker/02-compose/nginx.conf) - Reverse proxy config used by the compose stack.
- [.env.example](docker/02-compose/.env.example) - Environment variable overrides for docker-compose (copy to `.env`).

---

### ☸️ 2. [Kubernetes](kubernetes/README.md)
- **01. Basics & Primitives**
  - [01-pod.yaml](kubernetes/01-basics/01-pod.yaml) - Single pod, resources, labels, and annotations.
  - [02-multi-container-pod.yaml](kubernetes/01-basics/02-multi-container-pod.yaml) - Sidecar pattern with shared `emptyDir` volume.
  - [03-replicaset.yaml](kubernetes/01-basics/03-replicaset.yaml) - Replica control with label matching.
  - [04-deployment.yaml](kubernetes/01-basics/04-deployment.yaml) - Rolling updates, liveness, readiness, and startup probes.
  - [05-namespace-and-quota.yaml](kubernetes/01-basics/05-namespace-and-quota.yaml) - Resource quotas and limit ranges.
- **02. Networking & Services**
  - [01-clusterip-service.yaml](kubernetes/02-networking-services/01-clusterip-service.yaml) - Internal service load balancing.
  - [02-nodeport-service.yaml](kubernetes/02-networking-services/02-nodeport-service.yaml) - Exposing applications externally via high node ports.
  - [03-loadbalancer-service.yaml](kubernetes/02-networking-services/03-loadbalancer-service.yaml) - Cloud provider load balancer integration.
  - [04-ingress.yaml](kubernetes/02-networking-services/04-ingress.yaml) - Layer 7 reverse proxy routing and SSL termination.
  - [05-network-policy.yaml](kubernetes/02-networking-services/05-network-policy.yaml) - Zero-trust ingress/egress network isolation.
- **03. Config & Storage**
  - [01-configmap.yaml](kubernetes/03-config-and-storage/01-configmap.yaml) - Externalized config as env vars and mounted files.
  - [02-secret.yaml](kubernetes/03-config-and-storage/02-secret.yaml) - Sensitive credential handling and best practices.
  - [03-persistent-volume-claim.yaml](kubernetes/03-config-and-storage/03-persistent-volume-claim.yaml) - Dynamic PV/PVC provisioning.
  - [04-statefulset.yaml](kubernetes/03-config-and-storage/04-statefulset.yaml) - Stateful databases with headless service and volume templates.
- **04. Workloads & Batch**
  - [01-job.yaml](kubernetes/04-workloads-batch/01-job.yaml) - Run-to-completion batch jobs.
  - [02-cronjob.yaml](kubernetes/04-workloads-batch/02-cronjob.yaml) - Scheduled recurring tasks using cron syntax.
  - [03-daemonset.yaml](kubernetes/04-workloads-batch/03-daemonset.yaml) - Per-node agents for monitoring and logging.
- **05. Security & RBAC**
  - [01-serviceaccount.yaml](kubernetes/05-security-and-rbac/01-serviceaccount.yaml) - Pod identity for cluster API authentication.
  - [02-role-and-rolebinding.yaml](kubernetes/05-security-and-rbac/02-role-and-rolebinding.yaml) - Namespaced least-privilege permissions.
  - [03-clusterrole-binding.yaml](kubernetes/05-security-and-rbac/03-clusterrole-binding.yaml) - Cluster-wide authorization rules.
  - [04-security-context.yaml](kubernetes/05-security-and-rbac/04-security-context.yaml) - Hardened pod security (read-only rootfs, non-root user).
- **06. Advanced & Autoscaling**
  - [01-hpa.yaml](kubernetes/06-advanced-and-scaling/01-hpa.yaml) - Horizontal Pod Autoscaler for CPU/RAM scaling.
  - [02-vpa.yaml](kubernetes/06-advanced-and-scaling/02-vpa.yaml) - Vertical Pod Autoscaler resource sizing.
  - [03-pdb.yaml](kubernetes/06-advanced-and-scaling/03-pdb.yaml) - PodDisruptionBudget for high availability during drains.
  - [04-affinity-tolerations.yaml](kubernetes/06-advanced-and-scaling/04-affinity-tolerations.yaml) - NodeAffinity, PodAntiAffinity, taints, and tolerations.
  - [05-custom-resource-definition.yaml](kubernetes/06-advanced-and-scaling/05-custom-resource-definition.yaml) - CRDs and the Kubernetes Operator pattern.
- **07. Kustomize**
  - [07-kustomize/](kubernetes/07-kustomize/README.md) - Base + dev/prod overlays: customize plain YAML without templates.

---

### ⎈ 3. [Helm](helm/README.md)
- **Chart Structure (`my-web-app/`)**
  - [Chart.yaml](helm/01-chart-structure/my-web-app/Chart.yaml) - Chart metadata and semver versioning.
  - [values.yaml](helm/01-chart-structure/my-web-app/values.yaml) - Default values and toggleable features.
  - [_helpers.tpl](helm/01-chart-structure/my-web-app/templates/_helpers.tpl) - Named templates and label generators.
  - [deployment.yaml](helm/01-chart-structure/my-web-app/templates/deployment.yaml) - Templated deployment manifest.
  - [service.yaml](helm/01-chart-structure/my-web-app/templates/service.yaml) - Templated service manifest.
  - [ingress.yaml](helm/01-chart-structure/my-web-app/templates/ingress.yaml) - Conditional Ingress with TLS support.
  - [configmap.yaml](helm/01-chart-structure/my-web-app/templates/configmap.yaml) - Dynamic config map rendered from values.
  - [hpa.yaml](helm/01-chart-structure/my-web-app/templates/hpa.yaml) - Conditional Autoscaler template.
  - [serviceaccount.yaml](helm/01-chart-structure/my-web-app/templates/serviceaccount.yaml) - Dedicated service account.
  - [NOTES.txt](helm/01-chart-structure/my-web-app/templates/NOTES.txt) - Interactive terminal usage instructions.
- **Multi-Environment Values**
  - [values-dev.yaml](helm/02-environments/values-dev.yaml) - Development configuration.
  - [values-staging.yaml](helm/02-environments/values-staging.yaml) - Staging configuration.
  - [values-prod.yaml](helm/02-environments/values-prod.yaml) - Production configuration with TLS and HPA enabled.

---

### 📜 4. [Ansible](ansible/README.md)
- [ansible.cfg](ansible/ansible.cfg) - Configuration file with SSH pipelining and defaults.
- [hosts.ini](ansible/inventories/hosts.ini) - Inventory defining servers, groups, and host parameters.
- [all.yml](ansible/inventories/group_vars/all.yml) - Global common variables.
- [webservers.yml](ansible/inventories/group_vars/webservers.yml) - Webserver tier specific variables.
- [01-ping-and-setup.yml](ansible/playbooks/01-ping-and-setup.yml) - Host ping and OS package baseline update.
- [02-install-docker.yml](ansible/playbooks/02-install-docker.yml) - Automated Docker Engine & containerd installation.
- [03-deploy-nginx.yml](ansible/playbooks/03-deploy-nginx.yml) - Idempotent Nginx deployment using handlers.
- [04-security-hardening.yml](ansible/playbooks/04-security-hardening.yml) - SSH key enforcement and UFW firewall configuration.
- [site.yml](ansible/playbooks/site.yml) - Master playbook orchestrating roles across the fleet.
- [roles/common/tasks/main.yml](ansible/roles/common/tasks/main.yml) - Shared baseline role.
- [roles/webserver/tasks/main.yml](ansible/roles/webserver/tasks/main.yml) - Web server role tasks.
- [roles/webserver/templates/index.html.j2](ansible/roles/webserver/templates/index.html.j2) - Dynamic Jinja2 landing page template.
- [roles/webserver/handlers/main.yml](ansible/roles/webserver/handlers/main.yml) - Service restart handlers.

---

### 🌍 5. [Terraform](terraform/README.md)
- **01. Basics**
  - [main.tf](terraform/01-basics/main.tf) - Terraform block and local provider configuration.
  - [variables.tf](terraform/01-basics/variables.tf) - Input variables with validation blocks.
  - [outputs.tf](terraform/01-basics/outputs.tf) - Output definitions.
  - [terraform.tfvars.example](terraform/01-basics/terraform.tfvars.example) - Sample variables override file.
- **02. Reusable Modules**
  - [modules/vpc/main.tf](terraform/02-modules/modules/vpc/main.tf) - Reusable AWS VPC with public subnets.
  - [modules/vpc/variables.tf](terraform/02-modules/modules/vpc/variables.tf) - VPC variables.
  - [modules/vpc/outputs.tf](terraform/02-modules/modules/vpc/outputs.tf) - VPC output identifiers.
  - [modules/ec2/main.tf](terraform/02-modules/modules/ec2/main.tf) - Reusable EC2 Web Server with Security Group.
  - [modules/ec2/variables.tf](terraform/02-modules/modules/ec2/variables.tf) - EC2 variables.
  - [modules/ec2/outputs.tf](terraform/02-modules/modules/ec2/outputs.tf) - EC2 instance ID and public IP.
- **03. Environments**
  - [dev/main.tf](terraform/03-environments/dev/main.tf) - Development tier composition.
  - [prod/main.tf](terraform/03-environments/prod/main.tf) - Production tier composition.
- **04. Remote State**
  - [backend-s3.tf.example](terraform/04-state-management/backend-s3.tf.example) - S3 Remote Backend with DynamoDB state locking.

---

### 🔄 6. [CI/CD Automation](cicd/README.md)
- [build-test-scan.yml](cicd/github-actions/build-test-scan.yml) - GitHub Actions: unit test, Docker build, Aqua Trivy CVE scan, GHCR publish.
- [deploy-helm.yml](cicd/github-actions/deploy-helm.yml) - GitHub Actions: Helm deployment with GitHub Environment approval gates.
- [.gitlab-ci.yml](cicd/gitlab-ci/.gitlab-ci.yml) - GitLab CI multi-stage pipeline: lint, test, build, scan, manual deploy.

---

### 🐙 7. [GitOps with ArgoCD](gitops/README.md)
- [01-app-k8s.yaml](gitops/argocd/01-app-k8s.yaml) - ArgoCD Application syncing plain Kubernetes manifests with self-heal.
- [02-app-helm.yaml](gitops/argocd/02-app-helm.yaml) - ArgoCD Application deploying Helm charts with value overrides.
- [03-applicationset.yaml](gitops/argocd/03-applicationset.yaml) - Dynamic generation of dev, staging, and prod applications.
- [04-project.yaml](gitops/argocd/04-project.yaml) - Multi-tenant security boundaries and resource whitelist.

---

### 📊 8. [Observability & Monitoring](observability/README.md)
- [prometheus-config.yaml](observability/prometheus/prometheus-config.yaml) - Scrape jobs, intervals, and Kubernetes pod auto-discovery.
- [alert-rules.yaml](observability/prometheus/alert-rules.yaml) - Prometheus alerting rules (CPU overload, CrashLoopBackOff, Low Disk).
- [prometheus.yaml (Datasource)](observability/grafana/datasources/prometheus.yaml) - Automated Prometheus datasource for Grafana.
- [k8s-cluster-overview.json](observability/grafana/dashboards/k8s-cluster-overview.json) - Ready-to-import Grafana dashboard.
- [loki/](observability/loki/README.md) - Log aggregation: Loki + Promtail + Grafana in one local `docker compose`.

---

### 📦 9. [Packer: Machine Images](packer/README.md)
- [docker-ubuntu.pkr.hcl](packer/docker-ubuntu.pkr.hcl) - Free, local: bake a Docker image with nginx.
- [aws-ubuntu.pkr.hcl](packer/aws-ubuntu.pkr.hcl) - Bake an AWS AMI (costs money).

---

### 🔐 10. [Vault: Secrets Management](vault/README.md)
- [docker-compose.yml](vault/docker-compose.yml) - Dev-mode Vault server for practice.
- [app-policy.hcl](vault/app-policy.hcl) - Least-privilege read-only policy.

---

### 🧩 11. [Pulumi: IaC in Real Code](pulumi/README.md)
- [01-docker-python/](pulumi/01-docker-python/__main__.py) - Run an nginx container with Python. Free, no cloud account (Terraform alternative).

---

## 🛠️ Tool Installation & Setup Guides

Windows users: install [WSL2](https://learn.microsoft.com/windows/wsl/install) (Ubuntu) and follow the Linux steps inside it. macOS users: use [Homebrew](https://brew.sh) (`brew install <tool>`) for most tools below.

### 1. Docker
- **Docs**: [https://docs.docker.com/engine/install/](https://docs.docker.com/engine/install/) (Docker Desktop on macOS/Windows)
- **Linux**: follow the official repo instructions, then run without sudo:
  ```bash
  sudo usermod -aG docker $USER   # log out and back in afterwards
  docker run hello-world          # verify
  ```

### 2. Local Kubernetes cluster + `kubectl`
- **kind** (Kubernetes in Docker, used by `make kind-up`): [install guide](https://kind.sigs.k8s.io/docs/user/quick-start/#installation). Alternative: [minikube](https://minikube.sigs.k8s.io/docs/start/).
- **kubectl**: [https://kubernetes.io/docs/tasks/tools/](https://kubernetes.io/docs/tasks/tools/) (macOS: `brew install kubectl`).
- Verify: `kubectl cluster-info`

### 3. Helm
- **Docs**: [https://helm.sh/docs/intro/install/](https://helm.sh/docs/intro/install/) (macOS: `brew install helm`; Debian/Ubuntu: the official apt repo).
- Prefer package managers over piping scripts into `bash`; if you do use an install script, read it first.

### 4. Ansible
- **Docs**: [Installing Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- Easiest: `pipx install --include-deps ansible` (or `sudo apt install ansible`). You also need a Linux server reachable over SSH to run the playbooks for real; `--syntax-check` works without one.

### 5. Terraform
- **Docs**: [https://developer.hashicorp.com/terraform/install](https://developer.hashicorp.com/terraform/install) (follow the page for your OS; macOS: `brew install hashicorp/tap/terraform`).
- AWS examples also need the [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) and `aws configure`.

### 6. Argo CD (GitOps section)
- Needs a running cluster. Install: [Argo CD getting started](https://argo-cd.readthedocs.io/en/stable/getting_started/).

### 7. Prometheus & Grafana (Observability section)
- Easiest on a cluster: the [kube-prometheus-stack](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack) Helm chart. See [observability/README.md](observability/README.md).

---

## 🔒 Security & Production Best Practices

1. **Principle of Least Privilege**:
   - Restrict Kubernetes ServiceAccount access with scoped `Roles` rather than wide `ClusterRoles`.
   - Never run containers as `root` (enforce `runAsNonRoot: true` in SecurityContexts).
2. **Secrets Hygiene**:
   - Never commit raw credentials, private keys, or `.env` files to Git.
   - Use solutions such as HashiCorp Vault (see [vault/](vault/README.md)), AWS Secrets Manager, or Sealed Secrets.
3. **Idempotency & Immutability**:
   - Ensure Ansible playbooks are idempotent: test with `--check` dry-runs.
   - Prefer updating infrastructure declaratively through Terraform plans rather than manual console clicks.
4. **Shift-Left Security Scanning**:
   - Run automated container vulnerability scans (Trivy) and static analysis in CI before images reach registries.

---

## 🎓 Recommended Certifications & Career Paths

If you are pursuing certifications to validate your skills, this repository gives you hands-on practice with topics that appear in these exams (it is not a complete exam prep course):

- **Kubernetes**:
  - [CKA: Certified Kubernetes Administrator](https://www.cncf.io/certification/cka/)
  - [CKAD: Certified Kubernetes Application Developer](https://www.cncf.io/certification/ckad/)
  - [CKS: Certified Kubernetes Security Specialist](https://www.cncf.io/certification/cks/)
- **Infrastructure as Code**:
  - [HashiCorp Certified: Terraform Associate](https://www.hashicorp.com/certification/terraform-associate)
- **Linux & Automation**:
  - [RHCE: Red Hat Certified Engineer ](https://www.redhat.com/en/services/certification/rhce)
  - [LFCS: Linux Foundation Certified System Administrator](https://training.linuxfoundation.org/certification/linux-foundation-certified-sysadmin-lfcs/)

---

## 🤝 Contributing & License

Contributions and pull requests are warmly welcomed! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on code style and formatting standards.
This project is open-source and released under the [MIT License](LICENSE).
