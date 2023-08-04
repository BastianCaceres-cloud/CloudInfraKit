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

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

resource "aws_iam_openid_connect_provider" "oidc_provider" {
  url             = replace(data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer, "https://", "")
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = tolist(data.aws_eks_cluster.cluster.certificate_authority[0].data)
}

resource "null_resource" "eks_iam_serviceaccount" {
  provisioner "local-exec" {
    command = "eksctl create iamserviceaccount --cluster=${var.cluster_name} --namespace=kube-system --name=aws-load-balancer-controller --attach-policy-arn=${aws_iam_policy.alb_policy.arn} --approve --region=${data.aws_region.current.name}"
  }
}