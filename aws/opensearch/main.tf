provider "aws" {
  region = var.region
}

resource "aws_opensearchservice_domain" "main" {
  domain_name           = var.domain_name
  engine_version        = var.engine_version

  cluster_config {
    instance_type = var.instance_type
    instance_count = var.instance_count
  }

  ebs_options {
    ebs_enabled = var.ebs_enabled
    volume_size = var.volume_size
  }

  access_policies = <<POLICIES
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "opensearch:*",
      "Principal": "*",
      "Effect": "Allow",
      "Resource": "arn:aws:opensearch:${aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/${aws_opensearchservice_domain.main.domain_name}/*"
    }
  ]
}
POLICIES

  depends_on = [aws_iam_role.example]
}