data "databricks_metastores" "all" {
  depends_on = [ databricks_metastore.metastore ]
}

output "databricks-metastore-ids" {
  value = data.databricks_metastores.all.ids
}