resource "databricks_metastore" "metastore" {
  name = var.metastore_name
  storage_root = format("abfss://%s@%s.dfs.core.windows.net/",var.metastore_container_name,var.metastore_storage_account)
  owner         = var.databricks_admin
  region        = var.metastore_location
  force_destroy = true
}

