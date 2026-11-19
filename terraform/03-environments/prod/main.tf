# ==============================================================================
# Environment Configuration: Production
# ==============================================================================
# Production deployment with higher capacity instances and isolated CIDR.
# ==============================================================================

terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

locals {
  environment = "prod"
  common_tags = {
    Environment = local.environment
    ManagedBy   = "Terraform"
    Project     = "iac-demo"
    Compliance  = "PCI-DSS"
  }
}

module "vpc" {
  source = "../../02-modules/modules/vpc"

  environment         = local.environment
  cidr_block          = "10.20.0.0/16"
  public_subnet_cidrs = ["10.20.1.0/24", "10.20.2.0/24"]
  availability_zones  = ["us-east-1a", "us-east-1b"]
  tags                = local.common_tags
}

module "web_instance" {
  source = "../../02-modules/modules/ec2"

  environment   = local.environment
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.public_subnet_ids[0]
  instance_type = "t3.large" # Sized for production workloads
  tags          = local.common_tags
}

output "prod_web_public_ip" {
  description = "Public IP of Production Web Server"
  value       = module.web_instance.public_ip
}
