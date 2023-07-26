variable "vpc_id" {
  description = "ID of the VPC to associate the security group(s) with"
}

variable "security_groups" {
  description = "A map describing the security group(s) to create"
  type        = map(object({
    name        = string
    description = string
    vpc_id      = string
    ingress     = list(object({
      description     = string
      from_port       = number
      to_port         = number
      protocol        = string
      cidr_blocks     = list(string)
      security_groups = list(string)
    }))
    egress      = list(object({
      description     = string
      from_port       = number
      to_port         = number
      protocol        = string
      cidr_blocks     = list(string)
      security_groups = list(string)
    }))
    tags        = map(string)
  }))
}