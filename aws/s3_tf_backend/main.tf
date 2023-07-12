resource "aws_s3_bucket" "terraform_state" {
  bucket        = var.bucket_name
  force_destroy = var.force_destroy

  dynamic "server_side_encryption_configuration" {
    for_each = var.server_side_encryption ? [1] : []
    content {
      rule {
        apply_server_side_encryption_by_default {
          sse_algorithm = "AES256"
        }
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "access_block" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = var.versioning ? "Enabled" : "Suspended"
  }
}
