# ☸️ Kubernetes (K8s) Zero-to-Hero Guide & Manifests

Welcome to the **Kubernetes** section of this repository. Kubernetes is the industry-standard container orchestration platform designed to automate the deployment, scaling, and operations of containerized applications across host clusters.

---

## 🗺️ Progressive Learning Roadmap

This folder is organized logically from fundamental primitives to enterprise-level patterns:

```
kubernetes/
├── 01-basics/                  # Pods, ReplicaSets, Deployments, Namespaces
│   ├── 01-pod.yaml
│   ├── 02-multi-container-pod.yaml
│   ├── 03-replicaset.yaml
│   ├── 04-deployment.yaml
│   └── 05-namespace-and-quota.yaml
├── 02-networking-services/     # ClusterIP, NodePort, LoadBalancer, Ingress, NetworkPolicies
│   ├── 01-clusterip-service.yaml
│   ├── 02-nodeport-service.yaml
│   ├── 03-loadbalancer-service.yaml
│   ├── 04-ingress.yaml
│   └── 05-network-policy.yaml
├── 03-config-and-storage/      # ConfigMaps, Secrets, PV/PVC, StatefulSets
│   ├── 01-configmap.yaml
│   ├── 02-secret.yaml
│   ├── 03-persistent-volume-claim.yaml
│   └── 04-statefulset.yaml
├── 04-workloads-batch/         # Jobs, CronJobs, DaemonSets
│   ├── 01-job.yaml
│   ├── 02-cronjob.yaml
│   └── 03-daemonset.yaml
├── 05-security-and-rbac/       # ServiceAccounts, Roles, ClusterRoles, Hardened Pod Security
│   ├── 01-serviceaccount.yaml
│   ├── 02-role-and-rolebinding.yaml
│   ├── 03-clusterrole-binding.yaml
│   └── 04-security-context.yaml
└── 06-advanced-and-scaling/    # HPA, VPA, PDB, Affinity/Anti-Affinity, CRDs
└── 07-kustomize/               # Base + overlays: customize plain YAML without templates
    ├── 01-hpa.yaml
    ├── 02-vpa.yaml
    ├── 03-pdb.yaml
    ├── 04-affinity-tolerations.yaml
    └── 05-custom-resource-definition.yaml
```

---

## 🏗️ Core Architecture Overview

A Kubernetes cluster consists of two main components:

### 1. Control Plane (Brain of the Cluster)
- **kube-apiserver**: Front-end REST interface to which all components and `kubectl` communicate.
- **etcd**: Consistent, highly-available key-value store holding all cluster state and data.
- **kube-scheduler**: Watches for unscheduled pods and assigns them to suitable worker nodes.
- **kube-controller-manager**: Runs controllers that regulate the state of the cluster (Node Controller, Job Controller, Endpoints Controller).
- **cloud-controller-manager**: Integrates with cloud provider APIs (load balancers, routing, storage).

### 2. Worker Nodes (Compute Capacity)
- **kubelet**: Agent running on each node ensuring that containers described in PodSpecs are running and healthy.
- **kube-proxy**: Network proxy maintaining network rules on nodes allowing pod network communication.
- **Container Runtime**: Software responsible for running containers (containerd, CRI-O).

---

## 📑 File-by-File Breakdown & Manifest Links

### 1. Basics
- [01-pod.yaml](01-basics/01-pod.yaml) - The atomic unit of K8s. Demonstrates labels, annotations, ports, and resource limits.
- [02-multi-container-pod.yaml](01-basics/02-multi-container-pod.yaml) - Multi-container pattern (Sidecar) sharing an ephemeral volume.
- [03-replicaset.yaml](01-basics/03-replicaset.yaml) - Scaling and maintaining a constant pool of replica pods with label selectors.
- [04-deployment.yaml](01-basics/04-deployment.yaml) - Production deployment with RollingUpdates, readiness, liveness, and startup probes.
- [05-namespace-and-quota.yaml](01-basics/05-namespace-and-quota.yaml) - Environment isolation with ResourceQuotas and LimitRanges.

### 2. Networking & Services
- [01-clusterip-service.yaml](02-networking-services/01-clusterip-service.yaml) - Default internal service load balancing between pod endpoints.
- [02-nodeport-service.yaml](02-networking-services/02-nodeport-service.yaml) - Exposing applications externally via high node ports (`30000-32767`).
- [03-loadbalancer-service.yaml](02-networking-services/03-loadbalancer-service.yaml) - Provisioning cloud load balancers (AWS NLB/ALB, GCP LB).
- [04-ingress.yaml](02-networking-services/04-ingress.yaml) - Layer 7 HTTP/HTTPS reverse proxy with path/host routing and TLS termination.
- [05-network-policy.yaml](02-networking-services/05-network-policy.yaml) - Declarative firewall rules restricting ingress/egress between pods.

### 3. Configuration & Persistent Storage
- [01-configmap.yaml](03-config-and-storage/01-configmap.yaml) - Injecting configuration as environment variables and mounted files.
- [02-secret.yaml](03-config-and-storage/02-secret.yaml) - Handling sensitive credentials safely with best practices.
- [03-persistent-volume-claim.yaml](03-config-and-storage/03-persistent-volume-claim.yaml) - Persistent storage with StorageClasses, PVs, and PVCs.
- [04-statefulset.yaml](03-config-and-storage/04-statefulset.yaml) - Managing stateful databases with stable network identities and dedicated volume templates.

### 4. Workloads & Batch
- [01-job.yaml](04-workloads-batch/01-job.yaml) - One-off batch execution (e.g. database schema migrations).
- [02-cronjob.yaml](04-workloads-batch/02-cronjob.yaml) - Scheduled recurring tasks (nightly backups, data purges).
- [03-daemonset.yaml](04-workloads-batch/03-daemonset.yaml) - Running background monitoring or logging daemons on every single node.

### 5. Security & RBAC
- [01-serviceaccount.yaml](05-security-and-rbac/01-serviceaccount.yaml) - Identity for processes executing inside pods.
- [02-role-and-rolebinding.yaml](05-security-and-rbac/02-role-and-rolebinding.yaml) - Namespaced least-privilege permission grants.
- [03-clusterrole-binding.yaml](05-security-and-rbac/03-clusterrole-binding.yaml) - Cluster-wide authorization across all namespaces.
- [04-security-context.yaml](05-security-and-rbac/04-security-context.yaml) - Defense-in-depth container hardening (read-only rootfs, non-root user, capabilities drop).

### 6. Advanced & Autoscaling
- [01-hpa.yaml](06-advanced-and-scaling/01-hpa.yaml) - Horizontal Pod Autoscaler scaling replicas based on CPU/RAM utilization.
- [02-vpa.yaml](06-advanced-and-scaling/02-vpa.yaml) - Vertical Pod Autoscaler dynamically sizing container resource requests.
- [03-pdb.yaml](06-advanced-and-scaling/03-pdb.yaml) - PodDisruptionBudget ensuring minimum availability during maintenance/drain events.
- [04-affinity-tolerations.yaml](06-advanced-and-scaling/04-affinity-tolerations.yaml) - NodeAffinity, PodAntiAffinity, and node taints & tolerations.
- [05-custom-resource-definition.yaml](06-advanced-and-scaling/05-custom-resource-definition.yaml) - Extending Kubernetes with Custom Resources (CRDs) and the Operator pattern.

### 07. Kustomize
- [07-kustomize/](07-kustomize/README.md) - Base + dev/prod overlays, applied with `kubectl apply -k`.

---

## 🛠️ Essential `kubectl` Cheat Sheet

### Basic Cluster Inspection
```bash
kubectl cluster-info
kubectl get nodes -o wide
kubectl get namespaces
```

### Working with Workloads
```bash
# Create or update resources
kubectl apply -f <file-or-dir>

# List resources
kubectl get pods -A                         # All namespaces
kubectl get deployments -n <namespace>
kubectl get svc,ing,pvc

# Detailed inspection & debugging
kubectl describe pod <pod-name>
kubectl logs <pod-name> -f                  # Follow live logs
kubectl logs <pod-name> -c <container-name> # Multi-container pod
kubectl exec -it <pod-name> -- /bin/sh       # Interactive shell

# Port forward local port to pod/service
kubectl port-forward svc/<service-name> 8080:80
```

### Rollouts & Scaling
```bash
# Scale replicas manually
kubectl scale deployment webapp-deployment --replicas=5

# Rollout status and history
kubectl rollout status deployment/webapp-deployment
kubectl rollout history deployment/webapp-deployment
kubectl rollout undo deployment/webapp-deployment
```

---

## 🔗 Useful Official Resources & Tools
- [Official Kubernetes Documentation](https://kubernetes.io/docs/)
- [Minikube (Local Single-Node Cluster)](https://minikube.sigs.k8s.io/)
- [Kind (Kubernetes in Docker)](https://kind.sigs.k8s.io/)
- [k9s (Terminal UI for Kubernetes)](https://k9scli.io/)
- [kubectx and kubens](https://github.com/ahmetb/kubectx)
