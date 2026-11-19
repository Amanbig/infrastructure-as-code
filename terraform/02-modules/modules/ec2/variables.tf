variable "environment" {
  type        = string
  description = "Environment name"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the EC2 instance and SG will be created"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID to place the EC2 instance in"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance size"
  default     = "t3.micro"
}

variable "allowed_ssh_cidr" {
  type        = string
  description = "CIDR block permitted to SSH into instance"
  default     = "0.0.0.0/0"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
  default     = {}
}
