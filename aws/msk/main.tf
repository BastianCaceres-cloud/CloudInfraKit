provider "aws" {
  region = var.region
}

resource "aws_msk_cluster" "example" {
  cluster_name = var.cluster_name
  kafka_version = var.kafka_version
  number_of_broker_nodes = var.number_of_broker_nodes

  broker_node_group_info {
    instance_type   = var.instance_type
    client_subnets  = var.client_subnets
    security_groups = var.security_groups
    storage_info {
      ebs_storage_info {
        volume_size = var.volume_size
      }
    }
  }
}