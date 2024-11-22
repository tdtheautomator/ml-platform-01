/*
output "metastore_name" {
  value = databricks_metastore.metastore.name
}

output "metastore_id" {
  value = databricks_metastore.metastore.id
}
*/

output "metastore-accounts" {
  value = local.storage_account_ids
}