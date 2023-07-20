output "cluster_role_arn" {
  description = "The ARN of the EKS cluster role"
  value       = aws_iam_role.cluster.arn
}

output "fargate_pod_execution_role_arn" {
  description = "The ARN of the Fargate pod execution role"
  value       = aws_iam_role.fargate_pod_execution_role.arn
}