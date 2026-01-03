variable "default_tags" {
  description = "Tags padrão para serem aplicadas nos recursos"
  type        = map(string)
  default = {
    Global      = "Ohio"
    Region      = "US-East-2"
    Environment = "SBX"
    ManagedBy   = "Terraform"
  }
}
variable "vpc_cidr" {
  default = "10.200.0.0/16"
}
variable "region" {
  default = "us-east-2"
}
variable "aws_eks_name" {
  description = "Nome do cluster EKS"
  type        = string
  default = "eks-fiap-13-soat"
  nullable    = false
}
variable "aws_eks_version" {
  description = "Versão do cluster EKS"
  type        = string
  default = "1.33"
  nullable    = false
}
variable "aws_eks_managed_node_groups_instance_types" {
  description = "Tipos de instância para os nós gerenciados do EKS"
  type        = set(string)
  default = [ "t3a.small" ]
  nullable    = false
}