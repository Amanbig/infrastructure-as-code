# 🚀 Infrastructure as Code (IaC) & Cloud Native Learning Hub

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-v1.28+-326CE5?logo=kubernetes&logoColor=white)](https://kubernetes.io/)
[![Helm](https://img.shields.io/badge/Helm-v3+-0F1689?logo=helm&logoColor=white)](https://helm.sh/)
[![Ansible](https://img.shields.io/badge/Ansible-v2.15+-EE0000?logo=ansible&logoColor=white)](https://www.ansible.com/)
[![Terraform](https://img.shields.io/badge/Terraform-v1.5+-844FBA?logo=terraform&logoColor=white)](https://www.terraform.io/)

Welcome to the **Infrastructure as Code (IaC) & Cloud Native Learning Hub**! This repository is designed from the ground up as a hands-on, beginner-to-advanced learning resource. Whether you are stepping into DevOps for the first time or looking for battle-tested reference configurations, you will find modular, heavily commented, production-ready code here.

---

## 📚 Table of Contents

- [🗺️ DevOps & IaC Learning Roadmap](#️-devops--iac-learning-roadmap)
- [⚖️ Tool Comparison Matrix](#️-tool-comparison-matrix)
- [📁 Repository Structure & Direct File Links](#-repository-structure--direct-file-links)
  - [☸️ Kubernetes (K8s)](#️-kubernetes-k8s)
  - [⎈ Helm Charts](#-helm-charts)
  - [📜 Ansible Configuration](#-ansible-configuration)
  - [🌍 HashiCorp Terraform](#-hashicorp-terraform)
- [🛠️ Tool Installation & Setup Guides](#️-tool-installation--setup-guides)
- [🔒 Security & Production Best Practices](#-security--production-best-practices)
- [🎓 Recommended Certifications & Career Paths](#-recommended-certifications--career-paths)
- [🤝 Contributing & License](#-contributing--license)

---

## 🗺️ DevOps & IaC Learning Roadmap

Follow this step-by-step path to master modern infrastructure automation:

```
┌────────────────────────────────────────────────────────────────────────┐
│                        Step 1: Container Orchestration                │
│                            [ Kubernetes (K8s) ]                        │
│   Pods ➔ Deployments ➔ Services ➔ Ingress ➔ Volumes ➔ RBAC ➔ Autoscaling │
└───────────────────────────────────┬────────────────────────────────────┘
                                    │
                                    ▼
┌────────────────────────────────────────────────────────────────────────┐
│                        Step 2: Kubernetes Packaging                    │
│                                 [ Helm ]                               │
│        Templates ➔ values.yaml ➔ Chart Releases ➔ Multi-Environment    │
└───────────────────────────────────┬────────────────────────────────────┘
                                    │
                                    ▼
┌────────────────────────────────────────────────────────────────────────┐
│                     Step 3: Configuration Management                   │
│                               [ Ansible ]                              │
│       Agentless SSH ➔ Inventories ➔ Idempotent Playbooks ➔ Roles       │
└───────────────────────────────────┬────────────────────────────────────┘
                                    │
                                    ▼
┌────────────────────────────────────────────────────────────────────────┐
│                    Step 4: Cloud Infrastructure as Code                │
│                              [ Terraform ]                             │
│     HCL Syntax ➔ Plan & Apply ➔ Reusable Modules ➔ State Locking       │
└────────────────────────────────────────────────────────────────────────┘
```

---

## ⚖️ Tool Comparison Matrix

| Tool | Primary Purpose | How It Works | Agent Needed? | State Management |
| :--- | :--- | :--- | :--- | :--- |
| **[Kubernetes](kubernetes/README.md)** | Container orchestration & scheduling | Declarative YAML desired-state reconciliation | Yes (`kubelet` on worker nodes) | Persistent cluster state in `etcd` |
| **[Helm](helm/README.md)** | Kubernetes package manager | Parameterized Go templates with `values.yaml` | No (Client-side CLI) | Stored as Kubernetes Secrets inside cluster |
| **[Ansible](ansible/README.md)** | Server configuration & OS automation | Push-based idempotent tasks via SSH / WinRM | **No** (Purely agentless) | Stateless (Queries current machine state live) |
| **[Terraform](terraform/README.md)** | Cloud infrastructure provisioning | Declarative HCL orchestrating cloud APIs | No (Calls cloud REST APIs) | Stateful (`terraform.tfstate` local or remote S3) |

---

## 📁 Repository Structure & Direct File Links

### ☸️ [Kubernetes](kubernetes/README.md)
*Complete container orchestration manifests arranged from fundamental building blocks to advanced patterns.*

- **01. Basics & Fundamentals**
  - [01-pod.yaml](kubernetes/01-basics/01-pod.yaml) - Single container pod, resources, labels, and annotations.
  - [02-multi-container-pod.yaml](kubernetes/01-basics/02-multi-container-pod.yaml) - Sidecar pattern with shared `emptyDir` storage volume.
  - [03-replicaset.yaml](kubernetes/01-basics/03-replicaset.yaml) - Pod replica controller with label matching selectors.
  - [04-deployment.yaml](kubernetes/01-basics/04-deployment.yaml) - Zero-downtime rolling updates, liveness, readiness, and startup probes.
  - [05-namespace-and-quota.yaml](kubernetes/01-basics/05-namespace-and-quota.yaml) - Multi-tenancy isolation with ResourceQuotas and LimitRanges.
- **02. Networking & Services**
  - [01-clusterip-service.yaml](kubernetes/02-networking-services/01-clusterip-service.yaml) - Default internal service discovery & load balancing.
  - [02-nodeport-service.yaml](kubernetes/02-networking-services/02-nodeport-service.yaml) - Exposing applications externally via high node ports (`30000-32767`).
  - [03-loadbalancer-service.yaml](kubernetes/02-networking-services/03-loadbalancer-service.yaml) - Provisioning cloud load balancers (AWS NLB/ALB, GCP LB).
  - [04-ingress.yaml](kubernetes/02-networking-services/04-ingress.yaml) - Layer 7 HTTP/HTTPS reverse proxy with path/host routing & SSL termination.
  - [05-network-policy.yaml](kubernetes/02-networking-services/05-network-policy.yaml) - Zero-trust network isolation policies between pods.
- **03. Configuration & Persistent Storage**
  - [01-configmap.yaml](kubernetes/03-config-and-storage/01-configmap.yaml) - Decoupling configuration from containers as env vars and mounted files.
  - [02-secret.yaml](kubernetes/03-config-and-storage/02-secret.yaml) - Secure handling of confidential credentials and tokens.
  - [03-persistent-volume-claim.yaml](kubernetes/03-config-and-storage/03-persistent-volume-claim.yaml) - StorageClasses, PVs, and dynamic PVC storage allocation.
  - [04-statefulset.yaml](kubernetes/03-config-and-storage/04-statefulset.yaml) - Stateful workloads (Databases, Redis) with headless services & volume templates.
- **04. Workloads & Batch**
  - [01-job.yaml](kubernetes/04-workloads-batch/01-job.yaml) - Run-to-completion batch jobs (e.g., database schema migrations).
  - [02-cronjob.yaml](kubernetes/04-workloads-batch/02-cronjob.yaml) - Scheduled recurring tasks using standard cron syntax.
  - [03-daemonset.yaml](kubernetes/04-workloads-batch/03-daemonset.yaml) - Node-level background agents (monitoring, log collectors).
- **05. Security & RBAC**
  - [01-serviceaccount.yaml](kubernetes/05-security-and-rbac/01-serviceaccount.yaml) - Programmatic identity for pod workloads.
  - [02-role-and-rolebinding.yaml](kubernetes/05-security-and-rbac/02-role-and-rolebinding.yaml) - Granular namespace-level RBAC permissions.
  - [03-clusterrole-binding.yaml](kubernetes/05-security-and-rbac/03-clusterrole-binding.yaml) - Cluster-wide authorization rules across all namespaces.
  - [04-security-context.yaml](kubernetes/05-security-and-rbac/04-security-context.yaml) - CIS-hardened Pod security (non-root, read-only rootfs, capabilities drop).
- **06. Advanced & Autoscaling**
  - [01-hpa.yaml](kubernetes/06-advanced-and-scaling/01-hpa.yaml) - Horizontal Pod Autoscaler scaling pods based on CPU/RAM metrics.
  - [02-vpa.yaml](kubernetes/06-advanced-and-scaling/02-vpa.yaml) - Vertical Pod Autoscaler dynamically sizing container resource requests.
  - [03-pdb.yaml](kubernetes/06-advanced-and-scaling/03-pdb.yaml) - PodDisruptionBudget maintaining high availability during node drains/upgrades.
  - [04-affinity-tolerations.yaml](kubernetes/06-advanced-and-scaling/04-affinity-tolerations.yaml) - NodeAffinity, PodAntiAffinity, taints, and tolerations.
  - [05-custom-resource-definition.yaml](kubernetes/06-advanced-and-scaling/05-custom-resource-definition.yaml) - Extending Kubernetes with Custom Resources (CRDs) and the Operator pattern.

---

### ⎈ [Helm](helm/README.md)
*Package management for Kubernetes workloads across multiple environments.*

- **01. Chart Structure (`my-web-app/`)**
  - [Chart.yaml](helm/01-chart-structure/my-web-app/Chart.yaml) - Chart metadata, semantic versioning, and description.
  - [values.yaml](helm/01-chart-structure/my-web-app/values.yaml) - Default chart input variables.
  - [_helpers.tpl](helm/01-chart-structure/my-web-app/templates/_helpers.tpl) - Named templates, label generators, and naming conventions.
  - [deployment.yaml](helm/01-chart-structure/my-web-app/templates/deployment.yaml) - Templated deployment manifest.
  - [service.yaml](helm/01-chart-structure/my-web-app/templates/service.yaml) - Templated Kubernetes Service.
  - [ingress.yaml](helm/01-chart-structure/my-web-app/templates/ingress.yaml) - Conditional Ingress with TLS support.
  - [configmap.yaml](helm/01-chart-structure/my-web-app/templates/configmap.yaml) - Dynamic configuration map rendered from values.
  - [hpa.yaml](helm/01-chart-structure/my-web-app/templates/hpa.yaml) - Conditional Horizontal Pod Autoscaler.
  - [serviceaccount.yaml](helm/01-chart-structure/my-web-app/templates/serviceaccount.yaml) - Dedicated application service account.
  - [NOTES.txt](helm/01-chart-structure/my-web-app/templates/NOTES.txt) - Interactive post-install instructions printed to the user terminal.
- **02. Multi-Environment Value Overrides**
  - [values-dev.yaml](helm/02-environments/values-dev.yaml) - Development environment configuration.
  - [values-staging.yaml](helm/02-environments/values-staging.yaml) - Staging environment configuration.
  - [values-prod.yaml](helm/02-environments/values-prod.yaml) - Production environment configuration with autoscaling & TLS.

---

### 📜 [Ansible](ansible/README.md)
*Agentless configuration management, OS provisioning, and software deployment.*

- **Configuration & Inventories**
  - [ansible.cfg](ansible/ansible.cfg) - Main configuration file setting inventory path, SSH pipelining, and privilege escalation.
  - [hosts.ini](ansible/inventories/hosts.ini) - Inventory defining hosts, server groups, and host variables.
  - [all.yml](ansible/inventories/group_vars/all.yml) - Fleet-wide common variables.
  - [webservers.yml](ansible/inventories/group_vars/webservers.yml) - Variables scoped strictly to the webserver tier.
- **Playbooks**
  - [01-ping-and-setup.yml](ansible/playbooks/01-ping-and-setup.yml) - Ping check, timezone configuration, and baseline package updates.
  - [02-install-docker.yml](ansible/playbooks/02-install-docker.yml) - Complete Docker Engine & containerd setup on Linux.
  - [03-deploy-nginx.yml](ansible/playbooks/03-deploy-nginx.yml) - Idempotent Nginx web server deployment using handlers.
  - [04-security-hardening.yml](ansible/playbooks/04-security-hardening.yml) - UFW firewall configuration and SSH key-only hardening.
  - [site.yml](ansible/playbooks/site.yml) - Master playbook orchestrating multiple roles across the infrastructure.
- **Modular Roles**
  - [roles/common/tasks/main.yml](ansible/roles/common/tasks/main.yml) - Base operating system setup role.
  - [roles/webserver/tasks/main.yml](ansible/roles/webserver/tasks/main.yml) - Web server task definitions.
  - [roles/webserver/templates/index.html.j2](ansible/roles/webserver/templates/index.html.j2) - Dynamic Jinja2 web page template.
  - [roles/webserver/handlers/main.yml](ansible/roles/webserver/handlers/main.yml) - Service restart handlers.

---

### 🌍 [Terraform](terraform/README.md)
*Declarative cloud infrastructure provisioning with HashiCorp Configuration Language (HCL).*

- **01. Basics & Core Workflow**
  - [main.tf](terraform/01-basics/main.tf) - Terraform block, local/random providers, and local file resource.
  - [variables.tf](terraform/01-basics/variables.tf) - Input variables with custom validation rules.
  - [outputs.tf](terraform/01-basics/outputs.tf) - Output definitions.
  - [terraform.tfvars.example](terraform/01-basics/terraform.tfvars.example) - Sample variable values override.
- **02. Reusable Modules**
  - [modules/vpc/main.tf](terraform/02-modules/modules/vpc/main.tf) - Production-ready AWS VPC with public subnets and Internet Gateway.
  - [modules/vpc/variables.tf](terraform/02-modules/modules/vpc/variables.tf) - VPC input parameters.
  - [modules/vpc/outputs.tf](terraform/02-modules/modules/vpc/outputs.tf) - VPC outputs (VPC ID, Subnet IDs).
  - [modules/ec2/main.tf](terraform/02-modules/modules/ec2/main.tf) - EC2 Web Server instance with attached Security Group.
  - [modules/ec2/variables.tf](terraform/02-modules/modules/ec2/variables.tf) - EC2 input parameters.
  - [modules/ec2/outputs.tf](terraform/02-modules/modules/ec2/outputs.tf) - EC2 outputs (Instance ID, Public IP).
- **03. Environment Composition**
  - [dev/main.tf](terraform/03-environments/dev/main.tf) - Development environment assembling VPC and EC2 modules.
  - [prod/main.tf](terraform/03-environments/prod/main.tf) - Production environment assembling VPC and EC2 modules with production tier sizes.
- **04. Remote State & Locking**
  - [backend-s3.tf.example](terraform/04-state-management/backend-s3.tf.example) - Remote AWS S3 state backend with DynamoDB locking.

---

## 🛠️ Tool Installation & Setup Guides

### 1. Kubernetes CLI (`kubectl`)
- **What it is**: Command-line tool for communicating with the Kubernetes API server.
- **Official Docs**: [https://kubernetes.io/docs/tasks/tools/](https://kubernetes.io/docs/tasks/tools/)
- **Installation (Linux)**:
  ```bash
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  kubectl version --client
  ```
- **Local Testing Clusters**:
  - [Minikube](https://minikube.sigs.k8s.io/docs/start/): `curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && sudo install minikube-linux-amd64 /usr/local/bin/minikube`
  - [Kind (Kubernetes in Docker)](https://kind.sigs.k8s.io/): `go install sigs.k8s.io/kind@v0.22.0`

---

### 2. Helm
- **What it is**: The package manager for Kubernetes.
- **Official Docs**: [https://helm.sh/docs/intro/install/](https://helm.sh/docs/intro/install/)
- **Installation**:
  ```bash
  curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
  helm version
  ```

---

### 3. Ansible
- **What it is**: Agentless IT automation and configuration engine.
- **Official Docs**: [https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- **Installation (Python pip / apt)**:
  ```bash
  # Using pip (Recommended):
  python3 -m pip install --user ansible

  # On Ubuntu/Debian:
  sudo apt update && sudo apt install -y ansible
  ansible --version
  ```

---

### 4. HashiCorp Terraform
- **What it is**: Infrastructure as code tool for provisioning cloud and on-prem resources.
- **Official Docs**: [https://developer.hashicorp.com/terraform/install](https://developer.hashicorp.com/terraform/install)
- **Installation (Ubuntu/Debian)**:
  ```bash
  wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
  echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
  sudo apt update && sudo apt install terraform
  terraform version
  ```

---

## 🔒 Security & Production Best Practices

1. **Principle of Least Privilege**:
   - Limit Kubernetes ServiceAccount access using restrictive `Roles` rather than wide `ClusterRoles`.
   - Never run containers as `root` (use `runAsNonRoot: true` in Pod security contexts).
2. **Secrets Hygiene**:
   - Never commit raw credentials, SSH private keys, or API tokens to Git.
   - Use solutions such as HashiCorp Vault, AWS Secrets Manager, or Sealed Secrets.
3. **Idempotency & Immutability**:
   - Ensure Ansible playbooks are idempotent: test with `--check` dry-runs.
   - Prefer updating infrastructure declaratively through Terraform plans rather than manual changes in cloud consoles (avoid configuration drift).
4. **State Protection**:
   - Always store Terraform state files in a secure remote backend (e.g. AWS S3 with encryption and DynamoDB state locking).

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

Contributions, feedback, and pull requests are warmly welcomed!
This project is open-source and released under the [MIT License](LICENSE).
