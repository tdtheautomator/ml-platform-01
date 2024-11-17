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