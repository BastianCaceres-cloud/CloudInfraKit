variable "bucket_name" {
  description = "El nombre del bucket S3 para almacenar el estado de Terraform"
  type        = string
}

variable "versioning" {
  description = "Habilitar o deshabilitar el versionamiento en el bucket S3"
  type        = bool
  default     = true
}

variable "force_destroy" {
  description = "Un booleano que indica si todos los objetos (incluyendo todos los bloqueos de objetos) en el bucket deben ser destruidos antes de que el bucket en sí pueda ser destruido"
  type        = bool
  default     = false
}

variable "server_side_encryption" {
  description = "Habilitar o deshabilitar la encriptación del lado del servidor en el bucket S3"
  type        = bool
  default     = false
}
variable "enable_lifecycle_rules" {
  description = "Indica si se deben habilitar las políticas de ciclo de vida en el bucket"
  type        = bool
  default     = false
}

variable "enable_bucket_policy" {
  description = "Indica si se debe habilitar la política de bucket"
  type        = bool
  default     = false
}
