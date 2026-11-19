# 📜 Loki: Log Aggregation

Prometheus handles **metrics**; Loki handles **logs**. Loki indexes only labels (container, app), not log text,
so it is cheap to run. Flow: **Promtail** collects logs -> **Loki** stores them -> **Grafana** searches them with **LogQL**.

## Try it (free, local)
```bash
cd observability/loki
docker compose up -d
docker run --rm alpine sh -c 'for i in 1 2 3; do echo "hello from loki demo $i"; sleep 1; done'
```
Open Grafana at http://localhost:3000 -> **Explore** -> choose **Loki** -> run:
```
{container="loki"}                      # all logs from one container
{container=~".+"} |= "error"            # any container, lines containing "error"
rate({container="loki"}[1m])            # log lines per second
```
Cleanup: `docker compose down -v`

## On Kubernetes
Install the stack with Helm: `helm repo add grafana https://grafana.github.io/helm-charts && helm install loki grafana/loki-stack`
(or the newer `grafana/loki` chart). Promtail then runs as a DaemonSet (see `kubernetes/04-workloads-batch/03-daemonset.yaml` for the pattern).
