# Variables del modulo:

variable "cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "web_cidrs" {
  description = "CIDR block for the frontend subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "bussiness_cidrs" {
  description = "CIDR block for the backend subnets"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24", "10.0.14.0/24", "10.0.15.0/24", "10.0.16.0/24"]
}

variable "data_cidrs" {
  description = "CIDR block for the database subnets"
  type        = list(string)
  default     = ["10.0.21.0/24", "10.0.22.0/24", "10.0.23.0/24", "10.0.24.0/24", "10.0.25.0/24", "10.0.26.0/24"]
}

variable "availability_zones" {
  description = "List of Availability Zones to be used"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]
}

variable "vpc_name" {
  description = "Name of the VPC"
  default     = "vpc_1"
}

variable "web_tier_subnet_names" {
  description = "Names of the frontend subnets"
  type        = list(string)
  default     = ["web_tier_subnet_1", "web_tier_subnet_2", "web_tier_subnet_3", "web_tier_subnet_4", "web_tier_subnet_5", "web_tier_subnet_6"]
}

variable "bussiness_tier_subnet_names" {
  description = "Names of the backend subnets"
  type        = list(string)
  default     = ["bussiness_tier_subnet_1", "bussiness_tier_subnet_2", "bussiness_tier_subnet_3", "bussiness_tier_subnet_4", "bussiness_tier_subnet_5", "bussiness_tier_subnet_6"]
}

variable "data_tier_subnet_names" {
  description = "Names of the database subnets"
  type        = list(string)
  default     = ["data_tier_subnet_1", "data_tier_subnet_2", "data_tier_subnet_3", "data_tier_subnet_4", "data_tier_subnet_5", "data_tier_subnet_6"]
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {
    Owner       = "user"
    Environment = "test"
  }
}
