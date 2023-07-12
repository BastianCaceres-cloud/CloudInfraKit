variable "ecr_repository_name" {
  description = "El nombre del repositorio de ECR"
  type        = string
}

variable "ecr_image_tag_mutability" {
  description = "La mutabilidad de las etiquetas de la imagen"
  type        = string
  default     = "MUTABLE"
}

variable "ecr_scan_on_push" {
  description = "Habilitar o deshabilitar el escaneo de la imagen al hacer push"
  type        = bool
  default     = true
}
