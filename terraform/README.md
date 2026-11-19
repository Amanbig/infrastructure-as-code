# 🌍 Terraform: Declarative Infrastructure as Code (IaC)

Welcome to the **Terraform** section. HashiCorp Terraform is an open-source infrastructure as code tool that allows you to define, provision, and version both cloud and on-premises resources in human-readable configuration files.

---

## 🗺️ Directory Structure

```
terraform/
├── 01-basics/                     # Fundamental HCL concepts (runs locally without cloud creds!)
│   ├── main.tf                    # Provider configuration & local resources
│   ├── variables.tf               # Input variable declarations & validations
│   ├── outputs.tf                 # Output values
│   └── terraform.tfvars.example   # Example variables override
├── 02-modules/                    # Reusable, DRY infrastructure components
│   └── modules/
│       ├── vpc/                   # Reusable AWS VPC module with public subnets
│       │   ├── main.tf
│       │   ├── variables.tf
│       │   └── outputs.tf
│       └── ec2/                   # Reusable EC2 Web Server with Security Group
│           ├── main.tf
│           ├── variables.tf
│           └── outputs.tf
├── 03-environments/               # Environment composition using modules
│   ├── dev/main.tf                # Dev tier instantiation
│   └── prod/main.tf               # Production tier instantiation
└── 04-state-management/           # Enterprise state configuration
    └── backend-s3.tf.example      # S3 Remote State + DynamoDB State Locking
```

---

## 🧠 The Core Terraform Workflow

The lifecycle of any Terraform managed resource follows four stages:

```
┌──────────────┐     ┌──────────────┐     ┌──────────────┐     ┌───────────────┐
│ terraform    │ ──> │ terraform    │ ──> │ terraform    │ ──> │ terraform     │
│ init         │     │ plan         │     │ apply        │     │ destroy       │
│              │     │              │     │              │     │               │
│ Download     │     │ Compare      │     │ Provision    │     │ Teardown all  │
│ providers    │     │ state vs code│     │ real infra   │     │ resources     │
└──────────────┘     └──────────────┘     └──────────────┘     └───────────────┘
```

---

## 🛠️ Essential Terraform CLI Commands

### 1. Initialization & Formatting
```bash
# Initialize working directory, download providers & modules
terraform init

# Format all HCL files recursively to canonical standard
terraform fmt -recursive

# Validate syntax and configuration consistency
terraform validate
```

### 2. Planning and Applying
```bash
# Preview changes before applying
terraform plan

# Save plan to a file for predictable CI/CD execution
terraform plan -out=tfplan

# Apply changes directly
terraform apply

# Apply previously generated plan file
terraform apply tfplan

# Target a specific resource only
terraform apply -target=module.vpc
```

### 3. State Management & Inspection
```bash
# List all resources tracked in the current state file
terraform state list

# Show detailed attributes of a specific resource in state
terraform state show module.vpc.aws_vpc.this

# Refresh local state against real cloud infrastructure (detect drift)
terraform refresh

# Destroy all managed infrastructure safely
terraform destroy
```

---

## 📑 File Links

- [01-basics/main.tf](01-basics/main.tf)
- [01-basics/variables.tf](01-basics/variables.tf)
- [01-basics/outputs.tf](01-basics/outputs.tf)
- [01-basics/terraform.tfvars.example](01-basics/terraform.tfvars.example)
- [02-modules/modules/vpc/main.tf](02-modules/modules/vpc/main.tf)
- [02-modules/modules/vpc/variables.tf](02-modules/modules/vpc/variables.tf)
- [02-modules/modules/vpc/outputs.tf](02-modules/modules/vpc/outputs.tf)
- [02-modules/modules/ec2/main.tf](02-modules/modules/ec2/main.tf)
- [02-modules/modules/ec2/variables.tf](02-modules/modules/ec2/variables.tf)
- [02-modules/modules/ec2/outputs.tf](02-modules/modules/ec2/outputs.tf)
- [03-environments/dev/main.tf](03-environments/dev/main.tf)
- [03-environments/prod/main.tf](03-environments/prod/main.tf)
- [04-state-management/backend-s3.tf.example](04-state-management/backend-s3.tf.example)

---

## 🔗 Useful Official Resources
- [Official Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
- [Terraform Registry (Providers & Modules)](https://registry.terraform.io/)
- [HashiCorp Certified: Terraform Associate](https://www.hashicorp.com/certification/terraform-associate)
