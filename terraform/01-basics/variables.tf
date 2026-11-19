# ==============================================================================
# Terraform Basics: Input Variables
# ==============================================================================
# Input variables serve as parameters for a Terraform module, allowing aspects
# of the module to be customized without altering the module's own source code.
# ==============================================================================

variable "project_name" {
  type        = string
  description = "The name of the project or workload"
  default     = "iac-learning-hub"
}

variable "environment" {
  type        = string
  description = "Target deployment environment"
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod."
  }
}

variable "owner_email" {
  type        = string
  description = "Contact email of the resource owner"
  default     = "devops-learner@example.com"
}
