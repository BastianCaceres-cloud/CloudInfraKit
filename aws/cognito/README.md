# Módulo de Terraform para la autenticación de Cognito con OpenSearch

Este módulo de Terraform permite la creación de un pool de usuarios de AWS Cognito, un grupo de usuarios y un pool de identidades. Posteriormente, se integra este conjunto con un dominio de OpenSearch. Este módulo también crea un rol de IAM y una política asociada que permite a los usuarios de Cognito realizar operaciones en el dominio de OpenSearch especificado.

## Variables de entrada

- `region`: La región de AWS donde se desplegará el dominio. El valor por defecto es "us-west-2".
- `domain_name`: El nombre del dominio de OpenSearch.
- `user_pool_name`: El nombre del pool de usuarios de Cognito.
- `user_group_name`: El nombre del grupo de usuarios de Cognito.
- `user_group_description`: La descripción del grupo de usuarios de Cognito. Por defecto es "Grupo de usuarios de Cognito para OpenSearch".
- `identity_pool_name`: El nombre del pool de identidades de Cognito.
- `client_id`: ID del cliente para el proveedor de identidades de Cognito.
- `iam_role_name`: El nombre del rol de IAM para Cognito y OpenSearch.
- `iam_role_policy_name`: El nombre de la política del rol de IAM para Cognito y OpenSearch.

## Salidas

- `user_pool_id`: ID del pool de usuarios de Cognito.
- `user_group_id`: ID del grupo de usuarios de Cognito.
- `identity_pool_id`: ID del pool de identidades de Cognito.
- `opensearch_domain_endpoint`: Endpoint del dominio de OpenSearch.

## Uso

Para usar este módulo en tu configuración de Terraform, sigue estos pasos:

1. Asegúrate de tener instalado Terraform v0.13 o superior.
2. Configura tus credenciales de AWS, ya sea a través de la interfaz de línea de comandos de AWS o mediante variables de entorno.
3. Añade un bloque de módulo a tu configuración de Terraform. El bloque debe especificar la fuente del módulo junto con los valores de las variables de entrada.
4. Ejecuta `terraform init` para inicializar tu configuración y descargar el módulo.
5. Ejecuta `terraform apply` para crear los recursos.

Aquí tienes un ejemplo de cómo añadir este módulo a tu configuración:

```hcl
module "cognito_opensearch" {
  source = "git::https://github.com/tu_usuario/tu_repo.git//ruta_al_modulo"

  region                = "us-west-2"
  domain_name           = "mi-dominio-opensearch"
  user_pool_name        = "mi-pool-usuarios"
  user_group_name       = "mi-grupo-usuarios"
  user_group_description = "Grupo de usuarios para OpenSearch"
  identity_pool_name    = "mi-pool-identidades"
  client_id             = "mi-id-cliente"
  iam_role_name         = "mi-rol-iam"
  iam_role_policy_name  = "mi-politica-iam"
}
