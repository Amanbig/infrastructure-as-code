# Contributing Guidelines

Thank you for your interest in improving the Infrastructure as Code (IaC) Learning Hub!

## How to Contribute

1. **Fork & Branch**: Create a feature branch from `main` (`git checkout -b feature/new-k8s-manifest`).
2. **Coding Standards**:
   - YAML files should use 2-space indentation.
   - All manifests and configurations should include clear explanatory comments.
   - Run `terraform fmt -recursive` on Terraform files before submitting.
   - Run `helm lint` on any modified Helm templates.
   - Run `make lint` before opening a PR (it mirrors CI).
3. **Commit Messages**: Follow standard conventional commits format (e.g. `feat: add cilium network policy`, `docs: update helm readme`).
4. **Pull Requests**: Open a pull request against the `main` branch with a clear description of the addition or fix.

## Reporting Issues
If you encounter syntax issues or have suggestions for new scenarios, please open an Issue on GitHub.
