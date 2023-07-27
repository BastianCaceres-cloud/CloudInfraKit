
output "elasticsearch_domain_arn" {
  description = "ARN del dominio de Elasticsearch"
  value       = aws_elasticsearch_domain.main.arn
}

output "elasticsearch_domain_endpoint" {
  description = "Endpoint del dominio de Elasticsearch"
  value       = aws_elasticsearch_domain.main.endpoint
}