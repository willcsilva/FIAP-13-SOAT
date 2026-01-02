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
