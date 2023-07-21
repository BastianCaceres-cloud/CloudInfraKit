variable "region" {
  description = "The AWS region."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the EFS will be created."
  type        = string
}

variable "subnet_ids" {
  description = "The IDs of the subnets where the EFS mount targets will be created."
  type        = list(string)
}

variable "cidr_block" {
  description = "The CIDR block for the security group rules."
  type        = string
}

variable "creation_token" {
  description = "Unique name used to ensure idempotent file system creation."
  type        = string
}

variable "volume_name" {
  description = "The name of the volume."
  type        = string
}

variable "posix_user_gid" {
  description = "The POSIX group ID."
  type        = number
  default     = 1000
}

variable "posix_user_uid" {
  description = "The POSIX user ID."
  type        = number
  default     = 1000
}

variable "root_directory_path" {
  description = "The path for the root directory."
  type        = string
  default     = "/efs"
}

variable "creation_info_owner_gid" {
  description = "The POSIX group ID used for the creation info."
  type        = number
  default     = 1000
}

variable "creation_info_owner_uid" {
  description = "The POSIX user ID used for the creation info."
  type        = number
  default     = 1000
}

variable "creation_info_permissions" {
  description = "The POSIX permissions used for the creation info."
  type        = string
  default     = "777"
}

variable "security_group_name" {
  description = "The name of the security group."
  type        = string
}

variable "security_group_description" {
  description = "The description of the security group."
  type        = string
}
