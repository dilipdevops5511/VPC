variable "region" {
  description = "AWS region"
  default     = "us-east-1"  # Update with your desired AWS region
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
}

variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  default     = "my-eks-cluster"
}

variable "eks_node_instance_type" {
  description = "Instance type for EKS worker nodes"
  default     = "t3.medium"
}

variable "eks_node_capacity" {
  description = "Number of EKS worker nodes"
  default     = 2
}

variable "eks_node_min_capacity" {
  description = "Minimum number of EKS worker nodes"
  default     = 1
}

variable "eks_node_max_capacity" {
  description = "Maximum number of EKS worker nodes"
  default     = 3
}
