data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = data.eks.cluster.name
}

output "kubeconfig_filename" {
  value = data.eks.cluster.kubeconfig_filename
}
