output "elasticache_cluster_id" {
  description = "The ID of the ElastiCache cluster"
  value       = aws_elasticache_cluster.example.cluster_id
}

output "elasticache_cluster_endpoint" {
  description = "The endpoint of the ElastiCache cluster"
  value       = aws_elasticache_cluster.example.cache_nodes.0.address
}

output "elasticache_cluster_port" {
  description = "The port of the ElastiCache cluster"
  value       = aws_elasticache_cluster.example.cache_nodes.0.port
}
