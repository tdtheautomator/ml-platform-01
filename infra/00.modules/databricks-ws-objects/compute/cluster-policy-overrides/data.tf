data "databricks_cluster_policy" "default_cluster_policy" {
  provider = databricks.target_databricks_ws
  name     = var.builtin_policy_name
}
