resource "aws_dynamodb_table" "vault_dynamodb_backend" {
  name           = var.table_name
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = var.partition_key_name
  range_key      = var.sort_key_name

  attribute {
    name = var.partition_key_name
    type = var.partition_key_type
  }

  attribute {
    name = var.sort_key_name
    type = var.sort_key_type
  }

  tags = var.tags
}
