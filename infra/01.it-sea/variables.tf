#Declare Variables

variable "location" {
  type = string
}

variable "rg_name" {
  type    = string
  default = "null"
}


variable "department" {
  type = string
}

variable "environment" {
  type = string
}

variable "appname" {
  type = string
}

variable "deployment-type" {
  type    = string
  default = "terraform"
}

variable "vnet_address_space" {
  type = list(string)
}

variable "vnet_subnets" {
  type = map(any)
}


variable "account_kind" {}
variable "account_tier" {}
variable "account_replication_type" {}
variable "access_tier" {}
variable "hns_enabled" {}

#variable "clientId" {}
#variable "clientSecret" {}