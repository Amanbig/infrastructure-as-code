# ==============================================================================
# Environment Configuration: Development
# ==============================================================================
# Demonstrates assembling modular infrastructure for the 'dev' tier.
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
  environment = "dev"
  common_tags = {
    Environment = local.environment
    ManagedBy   = "Terraform"
    Project     = "iac-demo"
  }
}

module "vpc" {
  source = "../../02-modules/modules/vpc"

  environment         = local.environment
  cidr_block          = "10.10.0.0/16"
  public_subnet_cidrs = ["10.10.1.0/24", "10.10.2.0/24"]
  availability_zones  = ["us-east-1a", "us-east-1b"]
  tags                = local.common_tags
}

module "web_instance" {
  source = "../../02-modules/modules/ec2"

  environment   = local.environment
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.public_subnet_ids[0]
  instance_type = "t3.micro" # Cost-effective instance for development
  tags          = local.common_tags
}

output "dev_web_public_ip" {
  description = "Public IP of Dev Web Server"
  value       = module.web_instance.public_ip
}
