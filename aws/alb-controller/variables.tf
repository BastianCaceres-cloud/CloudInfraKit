
variable "cluster_name" {
  description = "The name of your EKS cluster"
  type        = string
}

variable "cluster_iam_role_name" {
  description = "The IAM role that provides permissions for the Kubernetes control plane to make calls to AWS API operations on your behalf."
  type        = string
}

variable "iam_policy_file" {
  description = "Path to the file containing the IAM policy in JSON format"
  type        = string
}