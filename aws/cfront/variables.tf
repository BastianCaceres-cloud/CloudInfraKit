variable "region" {
  description = "The region where to deploy the resources"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "bucket_acl" {
  description = "The access control list (ACL) of the S3 bucket"
  type        = string
  default     = "private"
}

variable "cloudfront_comment" {
  description = "A comment for the CloudFront origin access identity"
  type        = string
  default     = "OAI for s3 bucket"
}

variable "cloudfront_default_ttl" {
  description = "The default amount of time (in seconds) that an object is in a CloudFront cache"
  type        = number
  default     = 3600
}

variable "cloudfront_max_ttl" {
  description = "The maximum amount of time (in seconds) that an object is in a CloudFront cache"
  type        = number
  default     = 86400
}

variable "cloudfront_min_ttl" {
  description = "The minimum amount of time that you want objects to stay in CloudFront caches"
  type        = number
  default     = 0
}

variable "cloudfront_viewer_protocol_policy" {
  description = "The method that you want CloudFront to use to determine whether to use HTTP or HTTPS"
  type        = string
  default     = "allow-all"
}

variable "cloudfront_geo_restriction_type" {
  description = "The method that you want CloudFront to use to restrict access to your content by country"
  type        = string
  default     = "none"
}
