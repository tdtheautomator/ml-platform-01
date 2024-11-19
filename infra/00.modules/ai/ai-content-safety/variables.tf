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

variable "cognitive_acount_name" {}
variable "cognitive_acount_sku" {
  default = "S0"
}
variable "cognitive_acount_kind" {
  default = "ContentSafety"

}

variable "virtual_network_rules" {
  type = map(object({
    subnet_id                            = string
    ignore_missing_vnet_service_endpoint = optional(bool, false)
  }))
  default = {}
}

variable "allowed_cidrs" {
  type    = list(strin)
  default = null
}

variable "allowed_fqdns" {
  type    = list(string)
  default = null
}

variable "dynamic_throttling_enabled" {
  type    = bool
  default = false

}

variable "outbound_network_access_restricted" {
  type    = bool
  default = false
}

variable "public_network_access_enabled" {
  type    = bool
  default = true
}