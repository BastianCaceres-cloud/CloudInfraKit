resource "aws_ses_domain_identity" "example" {
  domain = var.domain
}

resource "aws_ses_domain_dkim" "example" {
  domain = aws_ses_domain_identity.example.id
}
