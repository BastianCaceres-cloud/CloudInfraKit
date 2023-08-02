Terraform AWS DynamoDB Table for Vault Backend
Este módulo crea una tabla de DynamoDB que puede ser utilizada como storage backend para HashiCorp Vault.


Uso
Aquí hay un ejemplo básico de cómo utilizar este módulo:


module "dynamodb_table" {
  source = "./modules/dynamodb_table"  # O la ruta donde esté tu módulo

  table_name        = "vault-data"
  read_capacity     = 5
  write_capacity    = 5
  partition_key_name = "Path"
  partition_key_type = "S"
  sort_key_name     = "Key"
  sort_key_type     = "S"
  tags              = {
    Name        = "vault-dynamodb-table"
    Environment = "prod"
  }
}



Inputs
table_name (requerido): El nombre de la tabla de DynamoDB.
read_capacity (opcional, por defecto = 5): El número máximo de operaciones de lectura por segundo.
write_capacity (opcional, por defecto = 5): El número máximo de operaciones de escritura por segundo.
partition_key_name (opcional, por defecto = "Path"): El nombre del atributo para la clave de partición de la tabla.
partition_key_type (opcional, por defecto = "S"): El tipo de atributo para la clave de partición de la tabla.
sort_key_name (opcional, por defecto = "Key"): El nombre del atributo para la clave de ordenamiento de la tabla.
sort_key_type (opcional, por defecto = "S"): El tipo de atributo para la clave de ordenamiento de la tabla.
tags (opcional, por defecto = {}): Un mapa de etiquetas para asignar al recurso.


Outputs
table_name: El nombre de la tabla de DynamoDB.
table_arn: El ARN de la tabla de DynamoDB.
table_id: El ID de la tabla de DynamoDB.
