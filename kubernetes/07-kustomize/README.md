# Kustomize

Kustomize customizes plain YAML **without templates**: a shared `base/` plus small per-environment `overlays/`.
It is built into `kubectl`.

```bash
kubectl kustomize kubernetes/07-kustomize/overlays/dev    # preview the rendered YAML
kubectl create namespace hello-dev
kubectl apply -k kubernetes/07-kustomize/overlays/dev     # apply it
kubectl delete -k kubernetes/07-kustomize/overlays/dev    # clean up
```

Compare `overlays/dev` and `overlays/prod` output to see what changes (name prefix, namespace, replicas, image tag).
Helm vs Kustomize: Helm uses templates + values; Kustomize patches plain YAML.
