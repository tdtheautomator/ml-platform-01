data "databricks_cluster_policy" "cluster_policy" {
  provider = databricks.target_databricks_ws
  name     = var.cluster_policy_name
}