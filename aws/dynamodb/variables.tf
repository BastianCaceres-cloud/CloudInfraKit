variable "table_name" {
  description = "The name of the DynamoDB table."
  type        = string
}

variable "read_capacity" {
  description = "The maximum number of read operations per second."
  type        = number
  default     = 5
}

variable "write_capacity" {
  description = "The maximum number of write operations per second."
  type        = number
  default     = 5
}

variable "partition_key_name" {
  description = "The name of the attribute for the partition key of the table."
  type        = string
  default     = "Path"
}

variable "partition_key_type" {
  description = "The type of the attribute for the partition key of the table."
  type        = string
  default     = "S"
}

variable "sort_key_name" {
  description = "The name of the attribute for the sort key of the table."
  type        = string
  default     = "Key"
}

variable "sort_key_type" {
  description = "The type of the attribute for the sort key of the table."
  type        = string
  default     = "S"
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
