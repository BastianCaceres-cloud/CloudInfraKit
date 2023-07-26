output "id" {
  description = "IDs of the created security groups"
  value       = values(aws_security_group.this)[*].id
}

output "arn" {
  description = "ARNs of the created security groups"
  value       = values(aws_security_group.this)[*].arn
}

output "name" {
  description = "Names of the created security groups"
  value       = values(aws_security_group.this)[*].name
}

output "description" {
  description = "Descriptions of the created security groups"
  value       = values(aws_security_group.this)[*].description
}

output "ingress_rules" {
  description = "List of ingress rules for the created security groups"
  value       = values(aws_security_group.this)[*].ingress
}

output "egress_rules" {
  description = "List of egress rules for the created security groups"
  value       = values(aws_security_group.this)[*].egress
}

output "security_groups" {
  description = "Map describing the created security groups"
  value = {
    for name, sg in aws_security_group.this :
    name => {
      id          = sg.id
      vpc_id      = sg.vpc_id
      name        = sg.name
      description = sg.description
      ingress     = sg.ingress
      egress      = sg.egress
      tags        = sg.tags
    }
  }
}




