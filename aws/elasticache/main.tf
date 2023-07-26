# Resources

resource "aws_elasticache_subnet_group" "example" {
  name       = var.subnet_group_name
  subnet_ids = var.subnet_ids
}

resource "aws_elasticache_cluster" "example" {
  cluster_id           = var.cluster_id
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  engine               = "redis"
  engine_version       = var.engine_version
  subnet_group_name    = aws_elasticache_subnet_group.example.name
  security_group_ids   = var.security_group_ids
  parameter_group_name = "default.redis7.0"
}