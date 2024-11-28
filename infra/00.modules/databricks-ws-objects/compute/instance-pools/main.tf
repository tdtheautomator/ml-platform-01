resource "databricks_instance_pool" "instance_pool" {
    for_each = var.instance_pools == {} || var.instance_pools == null ? {} : var.instance_pools
    provider     = databricks.target_databricks_ws
    instance_pool_name = "${var.department}_${var.appname}_${each.value.instance_pool_name}"
    min_idle_instances = each.value.min_idle_instances
    max_capacity = each.value.max_capacity
    node_type_id = each.value.node_type_id
    enable_elastic_disk = each.value.enable_elastic_disk
    preloaded_spark_versions = each.value.preloaded_spark_versions
    idle_instance_autotermination_minutes = each.value.idle_instance_autotermination_minutes
    custom_tags = each.value.custom_tags
  azure_attributes {
    availability = each.value.azure_attributes.availability
    spot_bid_max_price = tonumber(each.value.azure_attributes.spot_bid_max_price)
    
  }
  disk_spec {
    disk_size = each.value.disk_spec.disk_size
    disk_count = each.value.disk_spec.disk_count
    disk_type {
      azure_disk_volume_type = each.value.disk_spec.azure_disk_volume_type
    }
  }
}