provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr_block = var.vpc_cidr_block
  region         = var.region
}

module "eks_cluster" {
  source = "./modules/eks"

  eks_cluster_name       = var.eks_cluster_name
  vpc_id                 = module.vpc.vpc_id
  eks_node_instance_type = var.eks_node_instance_type
  eks_node_capacity      = var.eks_node_capacity
  eks_node_min_capacity  = var.eks_node_min_capacity
  eks_node_max_capacity  = var.eks_node_max_capacity
}
