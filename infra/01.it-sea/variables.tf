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

variable "instance_pools" {
  type = map(object({
    instance_pool_name       = string
    min_idle_instances       = number
    max_capacity             = number
    node_type_id             = string
    enable_elastic_disk      = bool
    preloaded_spark_versions = list(string)
    azure_attributes = object({
      availability       = string
      spot_bid_max_price = number
    })
    idle_instance_autotermination_minutes = number
    disk_spec = object({
      azure_disk_volume_type = string
      disk_size              = number
      disk_count             = number
    })
    custom_tags = map(string)
  }))
  default = {}
}

variable "clusters" {
  type = map(object({
    cluster_name                 = string
    spark_version                = string
    node_type_id                 = string
    enable_elastic_disk          = bool
    enable_local_disk_encryption = bool
    instance_pool_key            = string
    autotermination_minutes      = number
    autoscale_min_workers        = number
    autoscale_max_workers        = number
    num_workers                  = number
    cluster_mode                 = string
    spark_conf                   = map(string)
    azure_attributes = object({
      availability       = string
      first_on_demand    = number
      spot_bid_max_price = number
    })
    custom_tags          = map(string)
    use_instance_pool_id = bool
  }))
  default = {}
}
