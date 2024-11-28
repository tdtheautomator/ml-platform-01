data "databricks_cluster_policy" "cluster_policy" {
  provider = databricks.target_databricks_ws
  name     = var.cluster_policy_name
}

/*
data "databricks_instance_pool" "instance_pool_name" {
  name = var.worker_instance_pool_name
}

data "databricks_instance_pool" "driver_instance_pool_name" {
  name = var.driver_instance_pool_name
}
*/

