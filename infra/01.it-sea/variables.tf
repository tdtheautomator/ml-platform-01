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
  default   = null
  sensitive = true
}

variable "clientSecret" {
  default   = null
  sensitive = true
}
variable "open_api_key" {
  default   = null
  sensitive = true
}
variable "tenantId" {
  default   = null
  sensitive = true
}

variable "target_sub" {}
variable "databricks_account_id" {}
variable "model_serving_workspace" {}
variable "databricks_config_file" {}

#---------------------------Databricks Objects---------------------------

variable "target_databricks_workspace" {
  type = string
}

variable "notebooks" {
  type = map(object({
    content  = string
    path     = string
    language = string
  }))
  default = {}
}

variable "cluster_policy" {
  type = map(object({
    name              = string
    description       = string
    policy_definition = any
  }))
  default = {}
}

variable "cluster_policy_override" {
  type = map(object({
    definition_overrides = any
  }))
  default = {}
}
