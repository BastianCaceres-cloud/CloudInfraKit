data "aws_iam_policy_document" "alb_policy" {
  statement = jsondecode(file(var.iam_policy_file))
}


resource "aws_iam_policy" "alb_policy" {
  name   = "AWSLoadBalancerControllerIAMPolicy"
  policy = data.aws_iam_policy_document.alb_policy.json
}

data "aws_iam_role" "eks_cluster" {
  name = var.cluster_iam_role_name
}

resource "aws_iam_role_policy_attachment" "alb_policy_attach" {
  role       = data.aws_iam_role.eks_cluster.name
  policy_arn = aws_iam_policy.alb_policy.arn
}

data "aws_eks_cluster" "cluster" {
  name = var.cluster_name
}

data "aws_region" "current" {}

resource "aws_iam_openid_connect_provider" "oidc_provider" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_cert_request.cluster.certificate_pem]
  url             = replace(data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer, "https://", "")
}
