provider "aws" {
  region = var.region
}

module "eks_cluster" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 17.0"

  cluster_name    = var.eks_cluster_name
  cluster_version = "1.21"

  vpc_id = module.vpc.vpc_id

  subnets = {
    private = module.vpc.private_subnet_ids
    public  = module.vpc.public_subnet_ids
  }

  node_groups = {
    eks_nodes = {
      desired_capacity = var.eks_node_capacity
      max_capacity     = var.eks_node_max_capacity
      min_capacity     = var.eks_node_min_capacity
      instance_type    = var.eks_node_instance_type
      key_name         = aws_key_pair.key.key_name
    }
  }
}

resource "aws_key_pair" "key" {
  key_name   = "eks-key"
  public_key = file("~/.ssh/id_rsa.pub")
}
