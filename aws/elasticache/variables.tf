variable "cluster_id" {
  description = "Name of the ElastiCache cluster"
  type        = string
}

variable "node_type" {
  description = "Instance type to use for the cluster"
  type        = string
}

variable "num_cache_nodes" {
  description = "Number of cache nodes in the cluster"
  type        = number
}

variable "engine_version" {
  description = "Version of the Redis engine to use"
  type        = string
}

variable "subnet_group_name" {
  description = "Name of the subnet group to be used for the cluster"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the cluster"
  type        = list(string)
}

resource "aws_elasticache_cluster" "example" {
  cluster_id           = var.cluster_id
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  engine               = "redis"
  engine_version       = var.engine_version
  subnet_group_name    = var.subnet_group_name
  security_group_ids   = var.security_group_ids
  parameter_group_name = "default.redis5.0"
}
