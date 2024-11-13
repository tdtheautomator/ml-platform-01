resource "azurerm_databricks_access_connector" "access_connector" {
  name                            = var.access_connector_name
  location                        = var.location
  resource_group_name             = var.rg_name
  tags                            = var.default_tags

  identity {
    type         = "UserAssigned"
    identity_ids = [var.umi_id]
  }
}