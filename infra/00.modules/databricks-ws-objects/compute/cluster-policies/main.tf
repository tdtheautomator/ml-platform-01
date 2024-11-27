
resource "databricks_cluster_policy" "cluster_policy" {
  for_each    = var.cluster_policy == {} || var.cluster_policy == null ? {} : var.cluster_policy
  provider    = databricks.target_databricks_ws
  name        = "${each.value.name}"
  description = each.value.description
  definition  = jsonencode(each.value.policy_definition)
}
