Terraform AWS DynamoDB Table for Vault Backend
Este módulo crea una tabla de DynamoDB que puede ser utilizada como storage backend para HashiCorp Vault.

Uso
Aquí hay un ejemplo básico de cómo utilizar este módulo:


module "vault_dynamodb_backend" {
  source = "./dynamodb"

  table_name      = "vault-data"
  read_capacity   = 5
  write_capacity  = 5
  tags = {
    Name = "vault-data"
    Environment = "dev"
  }
}

Inputs

table_name: El nombre de la tabla de DynamoDB. Requerido, sin valor por defecto.
read_capacity: El número máximo de operaciones de lectura por segundo. Opcional, valor por defecto 5.
write_capacity: El número máximo de operaciones de escritura por segundo. Opcional, valor por defecto 5.
partition_key_name: El nombre del atributo para la clave de partición de la tabla. Opcional, valor por defecto "Path".
partition_key_type: El tipo de atributo para la clave de partición de la tabla. Opcional, valor por defecto "S".
sort_key_name: El nombre del atributo para la clave de ordenamiento de la tabla. Opcional, valor por defecto "Key".
sort_key_type: El tipo de atributo para la clave de ordenamiento de la tabla. Opcional, valor por defecto "S".
tags: Un mapa de etiquetas para asignar al recurso. Opcional, valor por defecto {}.

Outputs
table_name: El nombre de la tabla de DynamoDB.
table_arn: El ARN de la tabla de DynamoDB.
table_id: El ID de la tabla de DynamoDB.
