variable "location" {
  type = string
}

variable "rg_name" {
  type    = string
  default = null
}


variable "default_tags" {
  type    = map(string)
  default = null
}

variable "ai_search_name" {
}

variable "ai_search_sku" {
  default = "standard2"
}

variable "replica_count" {
  default = 3
}

variable "partition_count" {
  default = 1
}

variable "allowed_cidrs" {
  default = []
}

variable "hosting_mode" {
  default = null
}

variable "public_network_access_enabled" {
  default = true
}