# VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "my-vpc"
  }
}

# Public Subnets
resource "aws_subnet" "public" {
  count             = length(var.public_subnets_cidr_blocks)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnets_cidr_blocks[count.index]
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}

# Private Subnets
resource "aws_subnet" "private" {
  count             = length(var.private_subnets_cidr_blocks)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnets_cidr_blocks[count.index]
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}

# EKS Cluster
resource "aws_eks_cluster" "main" {
  name     = var.cluster_name
  role_arn = "ARN_OF_YOUR_EKS_SERVICE_ROLE"  # Specify the IAM role for the EKS cluster here

  vpc_config {
    subnet_ids = concat(
      aws_subnet.public[*].id,
      aws_subnet.private[*].id
    )

    security_group_ids = [aws_security_group.eks.id]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_attachment,
  ]
}
