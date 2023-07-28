variable "region" {
  description = "Region de AWS donde se desplegará el dominio"
  type        = string
  default     = "us-west-2"
}

variable "domain_name" {
  description = "Nombre del dominio de OpenSearch"
  type        = string
}

variable "user_pool_name" {
  description = "Nombre del pool de usuarios de Cognito"
  type        = string
}

variable "user_group_name" {
  description = "Nombre del grupo de usuarios de Cognito"
  type        = string
}

variable "user_group_description" {
  description = "Descripción del grupo de usuarios de Cognito"
  type        = string
  default     = "Grupo de usuarios de Cognito para OpenSearch"
}

variable "identity_pool_name" {
  description = "Nombre del pool de identidades de Cognito"
  type        = string
}

variable "client_id" {
  description = "ID del cliente para el proveedor de identidades de Cognito"
  type        = string
}

variable "iam_role_name" {
  description = "Nombre del rol de IAM para Cognito y OpenSearch"
  type        = string
}

variable "iam_role_policy_name" {
  description = "Nombre de la política del rol de IAM para Cognito y OpenSearch"
  type        = string
}
