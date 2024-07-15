provider "aws" {
  region = var.region
}

data "aws_eks_cluster" "cluster" {
  name = module.eks_cluster.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = data.aws_eks_cluster.cluster.name
}

output "kubeconfig_filename" {
  value = data.aws_eks_cluster_auth.cluster.kubeconfig_filename
}
