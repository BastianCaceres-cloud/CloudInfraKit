
# Terraform AWS EKS with Fargate Module

This module creates an Amazon EKS managed Kubernetes service using Fargate.

## Usage

```hcl
module "eks_fargate" {
  source       = "path_to_module"
  region       = "us-west-2"
  cluster_name = "my-eks-cluster"
  vpc_id       = "your_vpc_id"
  subnet_ids   = ["subnet_id1", "subnet_id2", ...]
}
```

## Inputs

| Name          | Description                             | Type         | Default       | Required |
|---------------|-----------------------------------------|--------------|---------------|:--------:|
| region        | AWS region                              | string       | "us-west-2"   | no       |
| cluster_name  | Name of the EKS cluster                 | string       | "my-eks-cluster" | no  |
| vpc_id        | ID of the VPC where the EKS cluster will be created | string | - | yes |
| subnet_ids    | List of subnet IDs for the EKS cluster  | list(string) | - | yes |

## Outputs

| Name                               | Description                                                             |
|------------------------------------|-------------------------------------------------------------------------|
| cluster_id                         | The name of the EKS cluster.                                           |
| cluster_security_group_id          | Security group ID attached to the EKS cluster.                          |
| cluster_iam_role_name              | IAM role name associated with EKS cluster.                              |
| cluster_certificate_authority_data | Nested attribute containing certificate-authority-data for your cluster.|
| cluster_endpoint                   | The endpoint for your EKS Kubernetes API.                               |
