data "databricks_metastores" "all" {}

/*
data "databricks_group" "admins" {
  for_each = toset(var.workspace_admins)
  provider = databricks.account
  display_name = each.key
  
}

data "databricks_group" "users" {
  for_each = toset(var.workspace_users)
  provider = databricks.account
  display_name = each.key
}
*/