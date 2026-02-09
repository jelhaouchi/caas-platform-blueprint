# CaaS Platform Blueprint - AWS (EKS)
#
# This module provisions:
# - VPC with public/private subnets
# - EKS cluster with managed node groups
# - IAM roles and IRSA configuration
# - ArgoCD bootstrap via Helm

terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
  }
}

provider "aws" {
  region = var.region
}
