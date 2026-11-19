# Glossary

| Term | Plain-English meaning |
| :--- | :--- |
| **Infrastructure as Code (IaC)** | Describing servers, networks and apps in files you keep in Git, instead of clicking in a console. |
| **Declarative** | You describe the *end result* ("3 copies running"); the tool figures out the steps. Terraform and Kubernetes work this way. |
| **Imperative** | You list the *steps* to run. Shell scripts are imperative. |
| **Idempotent** | Running it twice gives the same result as running it once. Ansible tasks aim for this. |
| **Container / Image** | An image is a packaged app + dependencies; a container is a running copy of it. |
| **Registry** | A server that stores images (Docker Hub, GHCR). |
| **Pod** | Smallest Kubernetes unit: one or more containers that run together. |
| **Deployment** | Kubernetes object that keeps N identical pods running and handles rolling updates. |
| **Service** | A stable network address in front of changing pods. |
| **Ingress** | HTTP routing rules from outside the cluster to Services. |
| **Namespace** | A named "folder" that separates resources inside a cluster. |
| **Manifest** | A YAML file describing a Kubernetes object. |
| **Chart / Release (Helm)** | A chart is a package of templates; a release is one installed copy of it. |
| **Inventory (Ansible)** | The list of servers Ansible manages. |
| **Playbook / Role** | A playbook is a list of tasks; a role is a reusable bundle of them. |
| **Provider (Terraform)** | A plugin that talks to a platform's API (AWS, local files, ...). |
| **State (Terraform)** | A file recording what Terraform created. Never commit it; it can hold secrets. |
| **Module** | A reusable group of Terraform resources. |
| **CI / CD** | Continuous Integration (auto test and build on every push) / Continuous Delivery (auto or one-click deploy). |
| **GitOps** | Git is the source of truth; a controller in the cluster makes reality match it. |
| **Drift** | When the live system no longer matches what's in Git/code. |
| **Reconciliation loop** | A controller repeatedly comparing desired vs actual state and fixing differences. |
| **Metric / TSDB** | A number measured over time / the time-series database that stores them (Prometheus). |
| **Scrape** | Prometheus fetching metrics from an endpoint. |
| **Alert rule** | A query that fires a notification when a condition holds. |
