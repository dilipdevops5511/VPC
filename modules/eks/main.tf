module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 17.0"

  cluster_name    = var.eks_cluster_name
  cluster_version = "1.21"
  vpc_id          = var.vpc_id

  subnets = {
    private = aws_subnet.private[*].id
    public  = aws_subnet.public[*].id
  }

  node_groups = {
    eks_nodes = {
      desired_capacity = var.eks_node_capacity
      max_capacity     = var.eks_node_max_capacity
      min_capacity     = var.eks_node_min_capacity
      instance_type    = var.eks_node_instance_type
    }
  }
}
