variable "location" {
  type = string
}

variable "rg_name" {
  type    = string
  default = null
}

variable "dns_zones" {
    type = list(string)
    default = ["privatelink.cognitiveservices.azure.com","privatelink.openai.azure.com","privatelink.azuredatabricks.net","privatelink.vaultcore.azure.net","privatelink.blob.core.windows.net","privatelink.file.core.windows.net","privatelink.dfs.core.windows.net","privatelink.web.core.windows.net"]
}