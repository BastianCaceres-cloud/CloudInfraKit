variable "region" {
  description = "Region de AWS donde se desplegará el dominio"
  type        = string
  default     = "us-west-2"
}

variable "domain_name" {
  description = "Nombre del dominio de OpenSearch"
  type        = string
}

variable "engine_version" {
  description = "Versión del motor de OpenSearch"
  type        = string
  default     = "OpenSearch_1.0"
}

variable "instance_type" {
  description = "Tipo de instancia de OpenSearch"
  type        = string
  default     = "m5.large.search"
}

variable "instance_count" {
  description = "Número de instancias de OpenSearch"
  type        = number
  default     = 1
}

variable "ebs_enabled" {
  description = "Si se debe habilitar EBS para OpenSearch"
  type        = bool
  default     = true
}

variable "volume_size" {
  description = "Tamaño del volumen de EBS en GB"
  type        = number
  default     = 10
}