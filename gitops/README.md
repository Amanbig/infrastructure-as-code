# 🐙 GitOps with ArgoCD: Declarative Continuous Delivery

Welcome to the **GitOps** learning section. GitOps is an operational framework that takes DevOps best practices used for application development (such as version control, collaboration, compliance, and CI) and applies them to modern cloud infrastructure automation.

---

## 🗺️ Directory Structure

```
gitops/
└── argocd/
    ├── 01-app-k8s.yaml         # ArgoCD Application tracking raw Kubernetes manifests
    ├── 02-app-helm.yaml        # ArgoCD Application rendering Helm charts with value overrides
    ├── 03-applicationset.yaml  # ApplicationSet generating dev/staging/prod environments dynamically
    └── 04-project.yaml         # AppProject enforcing multi-tenant security boundaries
```

---

> **Using a fork?** Every manifest in `argocd/` has `repoURL: https://github.com/Amanbig/infrastructure-as-code.git`. Change it to your fork's URL before applying.

---

## 🧠 The Core Principles of GitOps

1. **Declarative Everything**: The entire desired system state is described declaratively in Git (manifests, Helm values, network policies).
2. **Version Controlled Single Source of Truth**: Git is the single source of truth. Any rollback is just a `git revert`.
3. **Automated Pull-Based Delivery**: An in-cluster agent (ArgoCD or Flux) continuously pulls from Git and reconciles differences, eliminating the need to expose cluster API credentials to external CI runners.
4. **Continuous Drift Detection & Self-Healing**: If a user runs manual `kubectl delete` or `kubectl edit` in the cluster, ArgoCD detects the discrepancy and automatically restores the desired state from Git.

---

## 🔄 Push-Based CI/CD vs. Pull-Based GitOps

| Feature | Push-Based CI/CD (Traditional) | Pull-Based GitOps (ArgoCD) |
| :--- | :--- | :--- |
| **Trigger** | Pipeline runner connects to cluster | In-cluster agent pulls from Git |
| **Cluster Credentials** | Stored inside CI tool (Security risk) | Remain inside the Kubernetes cluster |
| **Configuration Drift** | Untracked; cluster drifts if modified manually | Automatically detected and reverted (Self-heal) |
| **Audit Log** | Fragmented across pipeline run logs | Complete Git commit history |

---

## 🛠️ ArgoCD Quickstart Commands

```bash
# Install ArgoCD into cluster
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Access the ArgoCD Web UI
kubectl port-forward svc/argocd-server -n argocd 8080:443

# Retrieve initial admin password
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

# Deploy the sample applications
kubectl apply -f gitops/argocd/01-app-k8s.yaml
kubectl apply -f gitops/argocd/03-applicationset.yaml
```

---

## 📑 File Links

- [01-app-k8s.yaml](argocd/01-app-k8s.yaml)
- [02-app-helm.yaml](argocd/02-app-helm.yaml)
- [03-applicationset.yaml](argocd/03-applicationset.yaml)
- [04-project.yaml](argocd/04-project.yaml)

---

## 🔗 Official Documentation
- [ArgoCD Documentation](https://argo-cd.readthedocs.io/)
- [OpenGitOps Standards](https://opengitops.dev/)
