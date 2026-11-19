# 🔐 HashiCorp Vault: Secrets Management

Vault stores secrets (passwords, API keys, certificates) centrally, encrypts them, controls who can read them
with **policies**, and records an audit trail. It replaces secrets in Git, `.env` files and plain Kubernetes Secrets
(which are only base64-encoded, not encrypted).

## Files
- [docker-compose.yml](docker-compose.yml) - a throwaway dev-mode Vault server.
- [app-policy.hcl](app-policy.hcl) - least-privilege read-only policy.

## Hands-on (10 minutes, free)
```bash
cd vault && docker compose up -d
export VAULT_ADDR=http://127.0.0.1:8200 VAULT_TOKEN=root
# Use the container's CLI if you don't have `vault` installed:
alias vault='docker exec -e VAULT_ADDR=http://127.0.0.1:8200 -e VAULT_TOKEN=root vault-dev vault'

vault kv put secret/myapp/db username=app password=s3cr3t     # write a secret
vault kv get secret/myapp/db                                  # read it back
vault kv get -field=password secret/myapp/db

# Policies: create a token that can ONLY read secret/myapp/*
docker cp app-policy.hcl vault-dev:/tmp/app-policy.hcl
vault policy write myapp /tmp/app-policy.hcl
vault token create -policy=myapp                              # copy the token
# Try it: VAULT_TOKEN=<that token> reads fine, but writing is "permission denied".

docker compose down                                           # cleanup (dev data is lost)
```
UI: http://localhost:8200 (sign in with token `root`).

## Key concepts
| Concept | Meaning |
| :--- | :--- |
| **Seal / Unseal** | Vault starts encrypted ("sealed"); unseal keys unlock it. Dev mode auto-unseals. |
| **Secrets engine** | A backend that stores or generates secrets (`kv`, `aws`, `database`). |
| **Auth method** | How clients prove who they are (token, Kubernetes, AppRole, OIDC). |
| **Policy** | Rules saying which paths an identity can read/write. |
| **Dynamic secrets** | Short-lived credentials generated on demand and auto-revoked. |

## Using Vault with Kubernetes
Install with the official Helm chart (`helm repo add hashicorp https://helm.releases.hashicorp.com && helm install vault hashicorp/vault`),
then use the **Vault Agent Injector** or the **External Secrets Operator** so pods receive secrets without storing them in Git.
Alternative for GitOps: [Sealed Secrets](https://github.com/bitnami-labs/sealed-secrets).

## Docs
- [Vault tutorials](https://developer.hashicorp.com/vault/tutorials)
