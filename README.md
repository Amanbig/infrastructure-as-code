# 🚀 Infrastructure as Code (IaC) & Cloud Native Learning Hub

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Docker](https://img.shields.io/badge/Docker-v24+-2496ED?logo=docker&logoColor=white)](https://www.docker.com/)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-v1.28+-326CE5?logo=kubernetes&logoColor=white)](https://kubernetes.io/)
[![Helm](https://img.shields.io/badge/Helm-v3+-0F1689?logo=helm&logoColor=white)](https://helm.sh/)
[![Ansible](https://img.shields.io/badge/Ansible-v2.15+-EE0000?logo=ansible&logoColor=white)](https://www.ansible.com/)
[![Terraform](https://img.shields.io/badge/Terraform-v1.5+-844FBA?logo=terraform&logoColor=white)](https://www.terraform.io/)
[![ArgoCD](https://img.shields.io/badge/ArgoCD-v2.9+-EF7B4D?logo=argo&logoColor=white)](https://argo-cd.readthedocs.io/)
[![Prometheus](https://img.shields.io/badge/Prometheus-v2.45+-E6522C?logo=prometheus&logoColor=white)](https://prometheus.io/)

Welcome to the **Infrastructure as Code (IaC) & Cloud Native Learning Hub**! This repository is designed from the ground up as a hands-on, beginner-to-advanced learning resource. Whether you are stepping into DevOps for the first time or looking for battle-tested reference configurations, you will find modular, heavily commented, production-ready code here.

---

## 📚 Table of Contents

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
- [🛠️ Tool Installation & Setup Guides](#️-tool-installation--setup-guides)
- [🔒 Security & Production Best Practices](#-security--production-best-practices)
- [🎓 Recommended Certifications & Career Paths](#-recommended-certifications--career-paths)
- [🤝 Contributing & License](#-contributing--license)

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

---

## 📁 Repository Structure & Direct File Links

### 🐳 1. [Docker & Containerization](docker/README.md)
- [Dockerfile.node](docker/01-dockerfiles/Dockerfile.node) - Multi-stage Node.js build with non-root user.
- [Dockerfile.golang](docker/01-dockerfiles/Dockerfile.golang) - Ultra-minimal statically compiled Go binary on `scratch`.
- [Dockerfile.python](docker/01-dockerfiles/Dockerfile.python) - Hardened Python multi-stage build using virtualenvs.
- [.dockerignore](docker/01-dockerfiles/.dockerignore) - Exclusion rules preventing large or sensitive files in builds.
- [docker-compose.yml](docker/02-compose/docker-compose.yml) - Multi-service local stack (Nginx, App, PostgreSQL, Redis).
- [.env.example](docker/02-compose/.env.example) - Environment variable overrides for docker-compose.

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

---

## 🛠️ Tool Installation & Setup Guides

### 1. Docker
- **Docs**: [https://docs.docker.com/engine/install/](https://docs.docker.com/engine/install/)
- **Install (Ubuntu/Debian)**: `sudo apt update && sudo apt install -y docker.io docker-compose-v2`

### 2. Kubernetes CLI (`kubectl`)
- **Docs**: [https://kubernetes.io/docs/tasks/tools/](https://kubernetes.io/docs/tasks/tools/)
- **Install (Linux)**:
  ```bash
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  ```

### 3. Helm
- **Docs**: [https://helm.sh/docs/intro/install/](https://helm.sh/docs/intro/install/)
- **Install**: `curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash`

### 4. Ansible
- **Docs**: [https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- **Install**: `python3 -m pip install --user ansible`

### 5. Terraform
- **Docs**: [https://developer.hashicorp.com/terraform/install](https://developer.hashicorp.com/terraform/install)
- **Install**:
  ```bash
  wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
  echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
  sudo apt update && sudo apt install terraform
  ```

---

## 🔒 Security & Production Best Practices

1. **Principle of Least Privilege**:
   - Restrict Kubernetes ServiceAccount access with scoped `Roles` rather than wide `ClusterRoles`.
   - Never run containers as `root` (enforce `runAsNonRoot: true` in SecurityContexts).
2. **Secrets Hygiene**:
   - Never commit raw credentials, private keys, or `.env` files to Git.
   - Use solutions such as HashiCorp Vault, AWS Secrets Manager, or Sealed Secrets.
3. **Idempotency & Immutability**:
   - Ensure Ansible playbooks are idempotent: test with `--check` dry-runs.
   - Prefer updating infrastructure declaratively through Terraform plans rather than manual console clicks.
4. **Shift-Left Security Scanning**:
   - Run automated container vulnerability scans (Trivy) and static analysis in CI before images reach registries.

---

## 🎓 Recommended Certifications & Career Paths

If you are pursuing certifications to validate your skills, this repository directly covers material for:

- **Kubernetes**:
  - [CKA: Certified Kubernetes Administrator](https://www.cncf.io/certification/cka/)
  - [CKAD: Certified Kubernetes Application Developer](https://www.cncf.io/certification/ckad/)
  - [CKS: Certified Kubernetes Security Specialist](https://www.cncf.io/certification/cks/)
- **Infrastructure as Code**:
  - [HashiCorp Certified: Terraform Associate](https://www.hashicorp.com/certification/terraform-associate)
- **Linux & Automation**:
  - [RHCE: Red Hat Certified Engineer (Ansible Automation)](https://www.redhat.com/en/services/certification/rhce)
  - [LFCS: Linux Foundation Certified System Administrator](https://training.linuxfoundation.org/certification/linux-foundation-certified-sysadmin-lfcs/)

---

## 🤝 Contributing & License

Contributions and pull requests are warmly welcomed! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on code style and formatting standards.
This project is open-source and released under the [MIT License](LICENSE).
