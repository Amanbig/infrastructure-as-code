# ⎈ Helm: The Kubernetes Package Manager

Welcome to the **Helm** learning section. Helm simplifies how applications are packaged, versioned, configured, and deployed onto Kubernetes clusters. Think of Helm as `apt`, `yum`, or `homebrew` for Kubernetes.

---

## 🗺️ Directory Structure

```
helm/
├── 01-chart-structure/
│   └── my-web-app/                 # Complete production-ready reference chart
│       ├── Chart.yaml              # Chart metadata & versioning
│       ├── values.yaml             # Default configuration values
│       └── templates/              # Manifest templates processed with Go templating
│           ├── _helpers.tpl        # Reusable template definitions & macros
│           ├── deployment.yaml     # Parametrized Deployment
│           ├── service.yaml        # Parametrized Service
│           ├── ingress.yaml        # Optional Ingress routing
│           ├── configmap.yaml      # Environment-derived ConfigMap
│           ├── hpa.yaml            # Optional Autoscaling (HPA)
│           ├── serviceaccount.yaml # ServiceAccount definition
│           └── NOTES.txt           # Post-install terminal instructions
└── 02-environments/
    ├── values-dev.yaml             # Development overrides (single replica, low resources)
    ├── values-staging.yaml         # Staging overrides (moderate resources, basic ingress)
    └── values-prod.yaml            # Production overrides (autoscaling, TLS ingress, high limits)
```

---

## 🧠 Core Concepts

1. **Chart**: A bundle of pre-configured Kubernetes resources (the code and manifests).
2. **Values (`values.yaml`)**: Configuration file containing user-supplied input values that customize the templates.
3. **Release**: A specific running instance of a chart deployed into a Kubernetes cluster.
4. **Repository**: A public or private HTTP server where packaged charts (`.tgz`) are hosted and indexed.

---

## 🛠️ Essential Helm CLI Commands

### 1. Creating and Inspecting Charts
```bash
# Create a skeleton chart
helm create my-chart

# Lint and validate chart syntax
helm lint helm/01-chart-structure/my-web-app

# Render templates locally to verify output without applying to cluster
helm template my-release helm/01-chart-structure/my-web-app -f helm/02-environments/values-dev.yaml
```

### 2. Installing and Upgrading Releases
```bash
# Install a release in a dedicated namespace
helm install webapp-dev helm/01-chart-structure/my-web-app \
  --namespace dev \
  --create-namespace \
  -f helm/02-environments/values-dev.yaml

# Upgrade an existing release (or install if not present)
helm upgrade --install webapp-prod helm/01-chart-structure/my-web-app \
  --namespace prod \
  --create-namespace \
  -f helm/02-environments/values-prod.yaml

# Override a single value on the command line
helm upgrade webapp-prod helm/01-chart-structure/my-web-app \
  --namespace prod \
  --set replicaCount=5
```

### 3. Managing Releases & History
```bash
# List all active releases across all namespaces
helm list -A

# View revision history of a release
helm history webapp-prod -n prod

# Roll back immediately to a previous revision (e.g. revision 2)
helm rollback webapp-prod 2 -n prod

# Uninstall / delete a release
helm uninstall webapp-dev -n dev
```

### 4. Working with Chart Repositories
```bash
# Add popular community repositories
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

# Update local repository cache
helm repo update

# Search for charts
helm search repo redis
```

---

## 📑 File Links

- [Chart.yaml](01-chart-structure/my-web-app/Chart.yaml)
- [values.yaml](01-chart-structure/my-web-app/values.yaml)
- [_helpers.tpl](01-chart-structure/my-web-app/templates/_helpers.tpl)
- [deployment.yaml](01-chart-structure/my-web-app/templates/deployment.yaml)
- [service.yaml](01-chart-structure/my-web-app/templates/service.yaml)
- [ingress.yaml](01-chart-structure/my-web-app/templates/ingress.yaml)
- [configmap.yaml](01-chart-structure/my-web-app/templates/configmap.yaml)
- [hpa.yaml](01-chart-structure/my-web-app/templates/hpa.yaml)
- [serviceaccount.yaml](01-chart-structure/my-web-app/templates/serviceaccount.yaml)
- [NOTES.txt](01-chart-structure/my-web-app/templates/NOTES.txt)
- [values-dev.yaml](02-environments/values-dev.yaml)
- [values-staging.yaml](02-environments/values-staging.yaml)
- [values-prod.yaml](02-environments/values-prod.yaml)

---

## 🔗 Useful Official Resources
- [Official Helm Documentation](https://helm.sh/docs/)
- [Artifact Hub (Public Helm Charts)](https://artifacthub.io/)
- [Helm Best Practices Guide](https://helm.sh/docs/chart_best_practices/)
