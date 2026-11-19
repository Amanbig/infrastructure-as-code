# ==============================================================================
# Terraform Basics: Output Values
# ==============================================================================
# Output values are like the return values of a Terraform module, and have several uses:
# 1. A child module can use outputs to expose a subset of its resource attributes to a parent module.
# 2. A root module can use outputs to print values in the CLI output after running terraform apply.
# ==============================================================================

output "generated_file_path" {
  description = "The path to the generated environment manifest file"
  value       = local_file.environment_manifest.filename
}

output "generated_server_name" {
  description = "The random server identifier produced"
  value       = "instance-${random_pet.server_name.id}"
}

output "deployment_summary" {
  description = "Summary string of the provisioned resource"
  value       = "Successfully provisioned ${var.project_name} for ${var.environment}"
}
