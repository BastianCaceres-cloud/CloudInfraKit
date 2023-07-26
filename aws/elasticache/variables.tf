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

variable "subnet_ids" {
  description = "List of subnet IDs to associate with the subnet group"
  type        = list(string)
}