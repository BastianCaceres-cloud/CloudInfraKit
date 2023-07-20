module "eks_iam_roles" {
  source = "git::https://github.com/tu_usuario/tu_repo.git//ruta/al/modulo?ref=main"
  
  region       = "us-east-1"
  cluster_name = "mi-cluster-eks"
}

output "cluster_role_arn" {
  value = module.eks_iam_roles.cluster_role_arn
}

output "fargate_pod_execution_role_arn" {
  value = module.eks_iam_roles.fargate_pod_execution_role_arn
}
