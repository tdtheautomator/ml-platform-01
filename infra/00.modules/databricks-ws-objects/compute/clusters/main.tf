resource "databricks_cluster" "cluster" {
  for_each                     = var.clusters == {} || var.clusters == null ? {} : var.clusters
  provider                     = databricks.target_databricks_ws
  cluster_name                 = "${var.department}_${var.appname}_${each.value.cluster_name}"
  spark_version                = each.value.spark_version
  autotermination_minutes      = each.value.autotermination_minutes
  num_workers                  = each.value.cluster_mode == "single_node" ? 0 : each.value.num_workers
  data_security_mode           = each.value.data_security_mode
  enable_elastic_disk          = each.value.enable_elastic_disk
  enable_local_disk_encryption = each.value.enable_local_disk_encryption
  spark_conf                   = merge(local.spark_config, each.value.spark_conf)
  #instance_pool_id             = each.value.use_instance_pool_id ? databricks_instance_pool.instance_pool[each.value.instance_pool_key].id : null
  node_type_id                 = each.value.use_instance_pool_id ? null : each.value.node_type_id
  custom_tags                  = each.value.custom_tags
  policy_id = data.databricks_cluster_policy.cluster_policy.id
  dynamic "autoscale" {
    for_each = each.value.cluster_mode == "single_node" ? [] : [1]
    content {
      min_workers = each.value.autoscale_min_workers
      max_workers = each.value.autoscale_max_workers
    }

  }
  azure_attributes {
    availability       = each.value.azure_attributes.availability
    first_on_demand    = each.value.azure_attributes.first_on_demand
    spot_bid_max_price = each.value.azure_attributes.spot_bid_max_price
  }
}