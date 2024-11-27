
variable "department" {
  type = string
  default = null
}

variable "appname" {
  type = string
  default = null
}

variable "cluster_policy_name" {
  type = string
  default = "Personal Compute"
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