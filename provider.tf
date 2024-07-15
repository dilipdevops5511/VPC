provider "aws" {
  region = "your-aws-region"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  default     = "my-eks-cluster"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnets_cidr_blocks" {
  description = "CIDR blocks for the public subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnets_cidr_blocks" {
  description = "CIDR blocks for the private subnets"
  default     = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
}
