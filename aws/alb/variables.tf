# Input Variables Obligatorias
variable "lb_name" {
  description = "Nombre del Application Load Balancer."
  type        = string
}

variable "subnets" {
  description = "Lista de IDs de subred para el Load Balancer."
  type        = list(string)
}

variable "security_groups" {
  description = "Lista de IDs de Security Group para el Load Balancer."
  type        = list(string)
}

variable "target_group_port" {
  description = "Puerto en el que el Target Group recibe el tráfico."
  type        = number
}

variable "vpc_id" {
  description = "ID del VPC donde se encuentra el Application Load Balancer."
  type        = string
}

# Input Variables Opcionales
variable "internal" {
  description = "Determina si el Load Balancer será interno o público."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags para aplicar a los recursos creados."
  type        = map(string)
  default     = {}
}

variable "listener_port" {
  description = "Puerto en el que el Listener escucha el tráfico."
  type        = number
  default     = 80
}

variable "listener_protocol" {
  description = "Protocolo utilizado por el Listener."
  type        = string
  default     = "HTTP"
}

variable "target_group_protocol" {
  description = "Protocolo utilizado por el Target Group."
  type        = string
  default     = "HTTP"
}

variable "target_group_attachments" {
  description = "List of instances to be associated with the target group."
  type = map(object({
    target_id = string
    port      = number
  }))
  default = {}
}



variable "additional_target_groups" {
  description = "Configuración de Target Groups adicionales."
  type        = list(object({
    name     = string
    port     = number
    protocol = string
  }))
  default = []
}

variable "https_listener" {
  description = "Configuración del Listener HTTPS."
  type = object({
    port               = number
    certificate_arn    = string
    ssl_policy         = string
    additional_actions = list(any)
  })
  default = null
}


variable "asg_target_group_attachments" {
  description = "List of instances created by ASG to be associated with the target group."
  type = map(object({
    target_id = string
    port      = number
  }))
  default = {}
}
