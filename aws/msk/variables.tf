variable "region" {
  description = "The region where AWS operations will be executed"
  type        = string
  default     = "us-west-2"
}

variable "cluster_name" {
  description = "Name of the MSK cluster"
  type        = string
}

variable "kafka_version" {
  description = "The desired Kafka software version"
  type        = string
  default     = "2.2.1"
}

variable "number_of_broker_nodes" {
  description = "The desired number of broker nodes in the kafka cluster"
  type        = number
  default     = 3
}

variable "instance_type" {
  description = "The instance type to use for the Kafka brokers"
  type        = string
  default     = "kafka.m5.large"
}

variable "client_subnets" {
  description = "List of client subnets to associate with the MSK cluster"
  type        = list(string)
  default     = []
}

variable "security_groups" {
  description = "List of security groups to associate with the MSK cluster"
  type        = list(string)
  default     = []
}

variable "volume_size" {
  description = "The size in GiB of the EBS volume for the data drive on each broker node"
  type        = number
  default     = 1000
}