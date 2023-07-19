
provider "aws" {
  region = var.region
}

data "aws_ami" "eks_worker" {
  filter {
    name   = "name"
    values = ["amazon-eks-node-*"]
  }

  most_recent = true
  owners      = ["602401143452"] # Amazon EKS AMI account ID
}

resource "aws_eks_cluster" "cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.cluster.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  depends_on = [
    aws_iam_role_policy_attachment.cluster
  ]
}

resource "aws_iam_role" "cluster" {
  name = "${var.cluster_name}_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "cluster" {
  role       = aws_iam_role.cluster.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role" "fargate_pod_execution_role" {
  name = "fargate_pod_execution_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "eks-fargate-pods.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "fargate_pod_execution_role_policy_attachment" {
  role       = aws_iam_role.fargate_pod_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
}

resource "aws_eks_fargate_profile" "example" {
  fargate_profile_name  = "example"
  cluster_name          = aws_eks_cluster.cluster.name
  pod_execution_role_arn = aws_iam_role.fargate_pod_execution_role.arn

  subnet_ids = var.subnet_ids

  selector {
    namespace = "default"
  }
  
  selector {
    namespace = "kube-system"
  }

  depends_on = [
    aws_iam_role_policy_attachment.fargate_pod_execution_role_policy_attachment
  ]
}


locals {
  aws_auth_roles_yaml = [for role in var.aws_auth_roles : <<EOF
  - rolearn: ${role.rolearn}
    username: ${role.username}
    groups:
      - ${join("\n      - ", role.groups)}
  EOF
  ]

  aws_auth_users_yaml = [for user in var.aws_auth_users : <<EOF
  - userarn: ${user.userarn}
    username: ${user.username}
    groups:
      - ${join("\n      - ", user.groups)}
  EOF
  ]

  aws_auth_accounts_yaml = [for account in var.aws_auth_accounts : <<EOF
  - ${account}
  EOF
  ]
}

resource "kubernetes_config_map" "aws_auth" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    mapRoles    = join("\n", local.aws_auth_roles_yaml)
    mapUsers    = join("\n", local.aws_auth_users_yaml)
    mapAccounts = join("\n", local.aws_auth_accounts_yaml)
  }

  depends_on = [
    aws_eks_cluster.cluster,
  ]
}

data "aws_eks_cluster" "cluster" {
  name = aws_eks_cluster.cluster.name
}

data "aws_eks_cluster_auth" "cluster" {
  name = aws_eks_cluster.cluster.name
}


provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
  version                = "~> 1.9"
}

