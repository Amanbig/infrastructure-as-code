# 📊 Observability & Monitoring: Prometheus & Grafana

Welcome to the **Observability** section. You cannot manage what you cannot measure. Cloud-native systems require comprehensive observability across metrics, logs, and traces to detect incidents before they impact end users.

---

## 🗺️ Directory Structure

```
observability/
├── prometheus/
│   ├── prometheus-config.yaml  # Scrape configurations, evaluation intervals & Kubernetes SD
│   └── alert-rules.yaml        # Prometheus alerting rules (CPU, CrashLoopBackOff, Low Disk)
└── grafana/
    ├── datasources/
    │   └── prometheus.yaml     # Auto-provisioned Prometheus datasource
    └── dashboards/
        └── k8s-cluster-overview.json # Importable Grafana dashboard (CPU, RAM, Pod Restarts)
```

---

## 🧠 The Three Pillars of Observability

```
                       ┌─────────────────────────┐
                       │      Observability      │
                       └────────────┬────────────┘
         ┌──────────────────────────┼──────────────────────────┐
         ▼                          ▼                          ▼
   ┌───────────┐              ┌───────────┐              ┌───────────┐
   │  Metrics  │              │   Logs    │              │  Traces   │
   │(Prometheus│              │  (Loki /  │              │  (Jaeger/ │
   │ / Datadog)│              │ Fluentbit)│              │  Tempo)   │
   └───────────┘              └───────────┘              └───────────┘
```

1. **Metrics (Numeric Timestamps)**: High-level aggregations over time (CPU utilization, HTTP request rates, error status codes).
2. **Logs (Event Details)**: Context-rich line-by-line events recording errors, stack traces, and request payloads.
3. **Traces (Distributed Flow)**: Following a single request as it hops across dozens of microservices, identifying latency bottlenecks.

---

## 🛠️ PromQL Quick Reference Cheat Sheet

| Query | What it Measures |
| :--- | :--- |
| `rate(http_requests_total[5m])` | Request rate per second over a 5-minute window |
| `histogram_quantile(0.99, sum(rate(http_request_duration_seconds_bucket[5m])) by (le))` | 99th percentile (p99) latency across all endpoints |
| `100 - (avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)` | Total node CPU usage percentage |
| `sum(increase(kube_pod_container_status_restarts_total[1h])) by (pod)` | Pod restarts over the past 1 hour |

---

## 📑 File Links

- [prometheus-config.yaml](prometheus/prometheus-config.yaml)
- [alert-rules.yaml](prometheus/alert-rules.yaml)
- [prometheus.yaml (Datasource)](grafana/datasources/prometheus.yaml)
- [k8s-cluster-overview.json](grafana/dashboards/k8s-cluster-overview.json)

---

## 🔗 Official Documentation
- [Prometheus Official Documentation](https://prometheus.io/docs/)
- [Grafana Official Documentation](https://grafana.com/docs/)
- [OpenTelemetry Documentation](https://opentelemetry.io/)
