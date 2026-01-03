terraform {
  # Configuração dos provedores necessários
  required_providers {
    aws = {
      source  = "hashicorp/aws" 
      version = "~> 6.0"        
    }
  }

  backend "s3" {
    bucket = "s3-bucket-willow" #Ajustar para o seu bucket S3
    key    = "state/eks/tf-state"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "s3-bucket-willow"        # ajuste para o seu bucket S3
    key    = "state/eks/vpc/tf-state" # ajuste para o path onde o VPC grava o state
    region = "us-east-2"
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name    = "my-cluster"
  kubernetes_version = "1.33"

  addons = {
    coredns                = {}
    eks-pod-identity-agent = {
      before_compute = true
    }
    kube-proxy             = {}
    vpc-cni                = {
      before_compute = true
    }
  }


  endpoint_public_access = true

  enable_cluster_creator_admin_permissions = true

vpc_id                   = data.terraform_remote_state.vpc.outputs.vpc_id
subnet_ids               = data.terraform_remote_state.vpc.outputs.private_subnets
control_plane_subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnets

  # EKS Managed Node Group(s)
  eks_managed_node_groups = {
    example = {
      
    ami_type       = "AL2023_ARM_64_STANDARD"
    instance_types = ["t4g.xlarge"]
    capacity_type  = "SPOT"

      min_size     = 2
      max_size     = 5
      desired_size = 2
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
} 