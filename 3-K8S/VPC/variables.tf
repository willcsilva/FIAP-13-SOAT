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