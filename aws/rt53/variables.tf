variable "create_zone" {
  description = "Boolean para crear o no una nueva zona de Route 53"
  type        = bool
  default     = false
}

variable "zone_name" {
  description = "El nombre de la zona Route 53"
  type        = string
  default     = ""
}

variable "records" {
  description = "Mapa de registros DNS para crear en la zona de Route 53"
  type        = map(object({
    name    = string
    type    = string
    ttl     = number
    records = list(string)
  }))
  default     = {}
}

variable "tags" {
  description = "Etiquetas a aplicar a los recursos creados"
  type        = map(string)
  default     = {}
}
