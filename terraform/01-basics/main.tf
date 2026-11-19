# ==============================================================================
# Terraform Basics: 01 - Core Workflow & Provider Configuration
# ==============================================================================
# Demonstrates:
# - terraform {} configuration block
# - Required providers & version constraints
# - Resources, data sources, and variable interpolations
# ==============================================================================

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    # Local provider is used here so you can run 'terraform apply' locally without cloud credentials!
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5.0"
    }
  }
}

# Generates a random pet name for unique resource naming
resource "random_pet" "server_name" {
  length    = 2
  separator = "-"
}

# Writes an infrastructure inventory report file locally
resource "local_file" "environment_manifest" {
  filename = "${path.module}/generated-${var.environment}-manifest.json"
  content = jsonencode({
    project     = var.project_name
    environment = var.environment
    server_name = "instance-${random_pet.server_name.id}"
    created_at  = timestamp()
    owner       = var.owner_email
  })

  file_permission = "0644"
}
