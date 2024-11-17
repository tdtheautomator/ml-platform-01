variable "dbricks_subnets" {
}

variable "vnet_name" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "default_tags" {
  type    = map(string)
  default = null
}