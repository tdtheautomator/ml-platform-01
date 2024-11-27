
variable "department" {
  type    = string
  default = null
}

variable "appname" {
  type    = string
  default = null
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