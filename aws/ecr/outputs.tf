output "ecr_repository_url" {
  description = "El URL del repositorio de ECR"
  value       = aws_ecr_repository.repository.repository_url
}
