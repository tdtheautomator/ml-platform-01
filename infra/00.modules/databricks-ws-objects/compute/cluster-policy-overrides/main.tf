
resource "databricks_cluster_policy" "cluster_policy_override" {
  for_each                           = var.cluster_policy_override == {} || var.cluster_policy_override == null ? {} : var.cluster_policy_override
  provider                           = databricks.target_databricks_ws
  name                               = "${var.department}_${var.builtin_policy_name}"
  policy_family_id = data.databricks_cluster_policy.default_cluster_policy.policy_family_id
  policy_family_definition_overrides = jsonencode(merge(jsondecode(data.databricks_cluster_policy.default_cluster_policy.definition),each.value.definition_overrides))
}