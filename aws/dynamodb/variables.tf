variable "table_name" {
  description = "The name of the DynamoDB table"
  type        = string
}

variable "read_capacity" {
  description = "The maximum number of read operations per second"
  type        = number
  default     = 5
}

variable "write_capacity" {
  description = "The maximum number of write operations per second"
  type        = number
  default     = 5
}

variable "partition_key_name" {
  description = "The attribute name for the table's partition key"
  type        = string
  default     = "Path"
}

variable "partition_key_type" {
  description = "The attribute type for the table's partition key"
  type        = string
  default     = "S"
}

variable "sort_key_name" {
  description = "The attribute name for the table's sort key"
  type        = string
  default     = "Key"
}

variable "sort_key_type" {
  description = "The attribute type for the table's sort key"
  type        = string
  default     = "S"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
