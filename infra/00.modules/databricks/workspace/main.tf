resource "azurerm_databricks_workspace" "databricks-workspace" {
  name                                  = var.dbricks_ws_name
  resource_group_name                   = var.rg_name
  managed_resource_group_name           = "${var.rg_name}-dbricks"
  location                              = var.location
  sku                                   = var.dbricks_sku
  network_security_group_rules_required = "NoAzureDatabricksRules"
  #default_storage_firewall_enabled                    = true
  #access_connector_id                                 = var.dbricks_access_connector_id
  tags = var.default_tags
  custom_parameters {
    no_public_ip                                         = true
    virtual_network_id                                   = var.vnet_id
    private_subnet_name                                  = var.dbricks_pvt_subnet
    public_subnet_name                                   = var.dbricks_pub_subnet
    private_subnet_network_security_group_association_id = var.dbricks_pvt_subnet_nsg_id
    public_subnet_network_security_group_association_id  = var.dbricks_pub_subnet_nsg_id
  }
}


resource "databricks_metastore_assignment" "assign_metastore" {
  provider = databricks.model_serving_ws
  metastore_id = lookup(local.metastore_ids,"metastore_${var.location}")
  workspace_id = azurerm_databricks_workspace.databricks-workspace.workspace_id
}


resource "databricks_group" "ws_admin_groups" {
  for_each = var.workspace_admins == null ? [] : toset(var.workspace_admins)
  provider = databricks.account
  display_name = each.key
  depends_on = [ data.databricks_metastores.all ]
}


resource "databricks_group" "ws_user_groups" {
  for_each = var.workspace_users == null ? [] : toset(var.workspace_users)
  provider = databricks.account
  display_name = each.key
  depends_on = [ data.databricks_metastores.all ]
}


resource "databricks_mws_permission_assignment" "ws_admins" {
  for_each = var.workspace_admins == null ? [] : toset(var.workspace_admins)
  provider = databricks.account
  workspace_id = azurerm_databricks_workspace.databricks-workspace.workspace_id
  principal_id = databricks_group.ws_admin_groups[each.key].id
  permissions = ["ADMIN"]
  }


  resource "databricks_mws_permission_assignment" "ws_users" {
  for_each = var.workspace_users == null ? [] : toset(var.workspace_users)
  provider = databricks.account
  workspace_id = azurerm_databricks_workspace.databricks-workspace.workspace_id
  principal_id = databricks_group.ws_user_groups[each.key].id
  permissions = ["USER"]
  }
