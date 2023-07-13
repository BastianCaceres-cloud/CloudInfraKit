variable "domain_name" {
  description = "El nombre de dominio para el certificado ACM"
  type        = string
}

variable "zone_id" {
  description = "El ID de la zona Route 53 donde se validará el certificado"
  type        = string
}

variable "tags" {
  description = "Etiquetas a aplicar al certificado ACM"
  type        = map(string)
  default     = {}
}


variable "validation_record_fqns" {
  description = "Fully Qualified Domain Names (FQDNs) de los registros de validación"
  type        = list(string)
}

variable "validation_record_names" {
  description = "Nombres de los registros de validación"
  type        = list(string)
}
