# -------------------------Common Variables---------------------------------------------------------------- ---------------------------------------------------
variable "location" {
  type = string
}

variable "environment" {
  type = string
}


variable "department" {
  type = string
}

variable "appname" {
  type = string
}

variable "deployment-type" {
  type    = string
  default = "terraform"
}
# ------------------------------------------------------------------------------------------------------ ---------------------------------------------------

variable "vnet_address_space" {
  type = list(string)
}

variable "vnet_subnets" {
}

variable "dbricks_subnets" {
  type = map(any)
}

variable "account_kind" {}
variable "account_tier" {}
variable "account_replication_type" {}
variable "access_tier" {}
variable "hns_enabled" {}

variable "clientId" {
  default = null
  sensitive = true
}

variable "clientSecret" {
  default = null
  sensitive = true
}
variable "open_api_key" {
  default = null
  sensitive = true
}
variable "tenantId" {
  default = null
  sensitive = true
}