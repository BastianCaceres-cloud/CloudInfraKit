output "opensearch_domain_arn" {
  description = "ARN del dominio de OpenSearch"
  value       = aws_opensearchservice_domain.main.arn
}

output "opensearch_domain_endpoint" {
  description = "Endpoint del dominio de OpenSearch"
  value       = aws_opensearchservice_domain.main.endpoint
}