
output "cluster_id" {
  description = "The name of the EKS cluster."
  value       = aws_eks_cluster.cluster.id
}

output "cluster_security_group_id" {
  description = "Security group ID attached to the EKS cluster."
  value       = aws_eks_cluster.cluster.vpc_config[0].cluster_security_group_id
}

output "cluster_iam_role_name" {
  description = "IAM role name associated with EKS cluster."
  value       = aws_iam_role.cluster.name
}

output "cluster_certificate_authority_data" {
  description = "Nested attribute containing certificate-authority-data for your cluster."
  value       = aws_eks_cluster.cluster.certificate_authority[0].data
}

output "cluster_endpoint" {
  description = "The endpoint for your EKS Kubernetes API."
  value       = aws_eks_cluster.cluster.endpoint
}

output "cluster_role_arn" {
  description = "The ARN of the EKS cluster role"
  value       = aws_iam_role.cluster.arn
}

output "fargate_pod_execution_role_arn" {
  description = "The ARN of the Fargate pod execution role"
  value       = aws_iam_role.fargate_pod_execution_role.arn
}
