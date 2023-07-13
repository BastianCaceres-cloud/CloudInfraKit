provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "b" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_ownership_controls" "s3_ownership_controls" {
  bucket = aws_s3_bucket.b.id
  
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "s3_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.s3_ownership_controls]

  bucket = aws_s3_bucket.b.id
  acl    = var.bucket_acl
}

resource "aws_s3_bucket_cors_configuration" "cors" {
  bucket = aws_s3_bucket.b.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST", "GET", "DELETE", "HEAD"]
    allowed_origins = ["*"]
  }
}

resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = var.cloudfront_comment
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  enabled = true
  
  origin {
    domain_name = aws_s3_bucket.b.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.b.id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
    }
  }
  
  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = aws_s3_bucket.b.id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = var.cloudfront_viewer_protocol_policy
    min_ttl                = var.cloudfront_min_ttl
    default_ttl            = var.cloudfront_default_ttl
    max_ttl                = var.cloudfront_max_ttl
  }

  restrictions {
    geo_restriction {
      restriction_type = var.cloudfront_geo_restriction_type
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
