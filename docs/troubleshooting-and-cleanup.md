# Troubleshooting & Cleanup

## Clean up so nothing keeps running (or costing money)

| Tool | Command |
| :--- | :--- |
| Docker Compose | `cd docker/02-compose && docker compose down -v` |
| Stray containers/images | `docker system prune -a` (removes ALL unused images) |
| kind cluster | `kind delete cluster --name iac-learning` |
| Kubernetes objects | `kubectl delete -f <file-or-dir>` |
| Helm release | `helm uninstall <release-name>` |
| Terraform | `terraform destroy` from the same folder you ran `apply` in |
| ArgoCD | `kubectl delete -f gitops/argocd/` then remove the `argocd` namespace |

> **Cloud cost warning:** the `terraform/02-modules` and `03-environments` examples create real AWS resources (VPC, EC2).
> Always run `terraform plan` first and `terraform destroy` when done. Set an AWS billing alert.

## Common problems

- **`permission denied` running docker** - add yourself to the docker group: `sudo usermod -aG docker $USER`, then log out/in.
- **Port already in use** - change the host port (`-p 8082:3000`, or `PROXY_PORT` in `docker/02-compose/.env`).
- **`The connection to the server localhost:8080 was refused`** - kubectl has no cluster. Run `make kind-up`, then `kubectl cluster-info`.
- **Pod stuck in `ImagePullBackOff`** - image name/tag is wrong, or the cluster can't reach the registry. `kubectl describe pod <name>`.
- **Pod in `CrashLoopBackOff`** - read the logs: `kubectl logs <pod> --previous`.
- **Pod `Pending`** - not enough resources or an unbound volume: `kubectl describe pod <name>` (see Events).
- **HPA/VPA shows `<unknown>`** - metrics-server (HPA) or the VPA controller is not installed in your cluster.
- **Ansible `UNREACHABLE`** - edit `ansible/inventories/hosts.ini` with a real host/user and make sure `ssh user@host` works.
- **Terraform `No valid credential sources`** - AWS examples need credentials (`aws configure`). Start with `terraform/01-basics`, which needs none.
- **ArgoCD can't find the repo** - the manifests in `gitops/argocd/` point to the original repo URL. Change `repoURL` to your fork.
