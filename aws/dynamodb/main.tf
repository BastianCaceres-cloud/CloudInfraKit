resource "aws_dynamodb_table" "vault_data" {
  name           = var.table_name
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity

  attribute {
    name = var.partition_key_name
    type = var.partition_key_type
  }

  attribute {
    name = var.sort_key_name
    type = var.sort_key_type
  }

  hash_key       = var.partition_key_name
  range_key      = var.sort_key_name

  tags = var.tags
}
