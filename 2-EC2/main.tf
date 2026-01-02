terraform {
  # Configuração dos provedores necessários
  required_providers {
    aws = {
      source  = "hashicorp/aws" # Provedor AWS oficial da HashiCorp
      version = "~> 5.0"        # Versão 5.x (última estável)
    }
  }

  backend "s3" {
    bucket = "s3-bucket-willow" #Ajustar para o seu bucket S3
    key    = "state/ec2/tf-state"
    region = "us-east-2"
  }
}