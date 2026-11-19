# 🧩 Pulumi: Infrastructure as Code in Real Programming Languages

Pulumi does the same job as Terraform (create and manage infrastructure declaratively, with state and a
preview-before-apply workflow) but you write **Python, TypeScript, Go, C# or Java** instead of HCL.
That gives you loops, functions, classes, packages and normal unit tests.

## Pulumi vs Terraform
| | Terraform | Pulumi |
| :--- | :--- | :--- |
| Language | HCL (a config language) | Python, TypeScript, Go, C#, Java |
| Preview / apply | `terraform plan` / `apply` | `pulumi preview` / `up` |
| State | `terraform.tfstate` (local or remote) | Pulumi Cloud, or local/S3 backend |
| Destroy | `terraform destroy` | `pulumi destroy` |
| Ecosystem / jobs | Largest | Smaller but growing |

Learn Terraform first (more common in jobs), then try Pulumi if you prefer real code.

## Files
- [01-docker-python/](01-docker-python/__main__.py) - runs an nginx container using Python. Free, no cloud account.

## Hands-on (free, local)
```bash
# Install: https://www.pulumi.com/docs/iac/download-install/
pulumi login --local                     # keep state on your machine, no account needed
cd pulumi/01-docker-python
python3 -m venv venv && venv/bin/pip install -r requirements.txt
pulumi stack init dev                    # a "stack" is one instance of your program (dev, prod, ...)
pulumi preview                           # show what would change
pulumi up                                # create it; then open http://localhost:8082
pulumi config set port 9090 && pulumi up # change a setting and update in place
pulumi destroy && pulumi stack rm dev    # cleanup
```
`pulumi stack init` asks for a passphrase when using the local backend (it encrypts secrets). Leave it empty for practice.

## Key concepts
| Concept | Meaning |
| :--- | :--- |
| **Project** | Folder with `Pulumi.yaml` and your program. |
| **Stack** | A separate deployment of the project (like Terraform workspaces/environments). |
| **Resource** | An object you declare (container, VM, bucket). |
| **Config** | Per-stack settings (`pulumi config set`). |
| **Outputs** | Values exported with `pulumi.export`. |
| **Backend** | Where state lives (Pulumi Cloud, local file, S3). |
