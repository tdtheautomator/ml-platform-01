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

variable "vnet_name" {
  type = string
}

variable "netwatch_name" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)
}

variable "vnet_subnets" {
}

