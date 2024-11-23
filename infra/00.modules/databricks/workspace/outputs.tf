output "databricks_workspace_id" {
  value = azurerm_databricks_workspace.databricks-workspace.workspace_id
}

output "databricks_workspace_name" {
  value = azurerm_databricks_workspace.databricks-workspace.name
}

output "databricks_workspace_url" {
  value = azurerm_databricks_workspace.databricks-workspace.workspace_url
}

output "databricks_ws_admins" {
  value = var.workspace_admins
}

output "databricks_ws_users" {
  value = var.workspace_users
}