resource "aws_s3_bucket" "storage_gw" {
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

  dynamic "lifecycle_rule" {
    for_each = var.enable_lifecycle_rules ? [1] : []
    content {
      id      = "LifecycleTransition"
      status  = "Enabled"

      transition {
        days          = 30
        storage_class = "STANDARD_IA"
      }

      transition {
        days          = 60
        storage_class = "GLACIER"
      }

      noncurrent_version_transition {
        days          = 90
        storage_class = "GLACIER"
      }

      expiration {
        days = 120
      }

      noncurrent_version_expiration {
        days = 120
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "access_block" {
  bucket = aws_s3_bucket.storage_gw.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.storage_gw.id

  versioning_configuration {
    status = var.versioning ? "Enabled" : "Suspended"
  }
}
