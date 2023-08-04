#!/bin/bash

# Replace these with your actual values
AWS_REGION=us-east-1
CLUSTER_NAME=eks-cluster-ahpp-sandbox
IAM_POLICY_NAME=AWSLoadBalancerControllerIAMPolicy
IAM_ROLE_NAME=eks-cluster-ahpp-sandbox-role-irsa
IAM_POLICY_FILE=iam-policy.json

# Associate IAM OIDC provider
eksctl utils associate-iam-oidc-provider \
    --region $AWS_REGION \
    --cluster $CLUSTER_NAME \
    --approve

# Create IAM policy
aws iam create-policy \
    --policy-name $IAM_POLICY_NAME \
    --policy-document file://$IAM_POLICY_FILE \
    --region $AWS_REGION

# Get the policy ARN
POLICY_ARN=$(aws iam list-policies --region $AWS_REGION --query 'Policies[?PolicyName==`'$IAM_POLICY_NAME'`].Arn' --output text)

# Create IAM role and attach the policy
aws iam create-role \
    --role-name $IAM_ROLE_NAME \
    --assume-role-policy-document '{"Version": "2012-10-17","Statement": [{"Effect": "Allow","Principal": {"Service": "eks.amazonaws.com"},"Action": "sts:AssumeRole"}]}' \
    --region $AWS_REGION

aws iam attach-role-policy \
    --role-name $IAM_ROLE_NAME \
    --policy-arn $POLICY_ARN \
    --region $AWS_REGION

# Create IAM service account
eksctl create iamserviceaccount \
    --cluster=$CLUSTER_NAME \
    --namespace=kube-system \
    --name=aws-load-balancer-controller \
    --attach-policy-arn=$POLICY_ARN \
    --approve \
    --region $AWS_REGION
