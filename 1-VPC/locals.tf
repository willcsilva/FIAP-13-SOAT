# Tags Communs para todos os Recursos
locals {
  common_tags = {
    Global      = "Ohio"
    Region      = "US-East-2"
    Environment = "SBX"
    ManagedBy   = "Terraform"
  }
}