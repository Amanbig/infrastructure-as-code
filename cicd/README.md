# 🔄 Continuous Integration & Continuous Delivery (CI/CD)

Welcome to the **CI/CD** learning section. CI/CD automates the repetitive manual steps between software development and production delivery: running automated tests, linting code, building container images, scanning for vulnerabilities, and deploying workloads safely.

---

## 🗺️ Directory Structure

```
cicd/
├── github-actions/
│   ├── build-test-scan.yml     # GitHub Actions: test, container build, Trivy CVE scan, GHCR push
│   └── deploy-helm.yml         # GitHub Actions: deployment to Kubernetes via Helm with approval gates
└── gitlab-ci/
    └── .gitlab-ci.yml          # Multi-stage GitLab CI: lint ➔ test ➔ build ➔ scan ➔ manual deploy
```

---

## 🧠 The 4 Key Stages of Modern CI/CD

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│ 1. Lint &   │ ──> │ 2. Build    │ ──> │ 3. Security │ ──> │ 4. Deploy   │
│    Test     │     │    Image    │     │    Scanning │     │  (CD Gate)  │
│             │     │             │     │             │     │             │
│ Unit tests, │     │ Multi-stage │     │ Trivy CVEs, │     │ Helm or     │
│ code format │     │ Docker build│     │ SAST scans  │     │ ArgoCD sync │
└─────────────┘     └─────────────┘     └─────────────┘     └─────────────┘
```

1. **Continuous Integration (CI)**: Validates every commit. Ensures new code does not break existing test suites or style standards.
2. **Security Shift-Left**: Vulnerability scanners like **Aqua Trivy** or **Snyk** analyze dependencies and base images *before* they are pushed to production registries.
3. **Continuous Delivery (CD)**: Automatically provisions or updates environments. Production rollouts typically enforce manual approval gates or Canary deployments.

---

## 📈 Industry Standard: DORA Metrics
High-performing DevOps teams measure CI/CD maturity using the four DORA metrics:
- **Deployment Frequency**: How often code is successfully deployed to production.
- **Lead Time for Changes**: The time it takes a commit to reach production.
- **Change Failure Rate**: Percentage of deployments causing a degradation in service.
- **Time to Restore Service (MTTR)**: How long it takes to recover from a production outage.

---

## 📑 File Links

- [build-test-scan.yml](github-actions/build-test-scan.yml)
- [deploy-helm.yml](github-actions/deploy-helm.yml)
- [.gitlab-ci.yml](gitlab-ci/.gitlab-ci.yml)

---

## 🔗 Useful Official Resources
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [GitLab CI/CD Documentation](https://docs.gitlab.com/ee/ci/)
- [Aqua Security Trivy](https://trivy.dev/)
