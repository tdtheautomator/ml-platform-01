
#-----------------Creating Subnets--------------------------------------------------
resource "azurerm_subnet" "databricks_subnets" {
  for_each             = var.dbricks_subnets
  name                 = each.value["name"]
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = each.value["addr"]
  service_endpoints    = ["Microsoft.KeyVault", "Microsoft.Storage"]
  delegation {
    name = "${each.value["name"]}-delegation"
    service_delegation {
      name = "Microsoft.Databricks/workspaces"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
        "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
        "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"
      ]
    }
  }
}
#-----------------------------------------------------------------------------------


#-----------------Creating Network Security Groups----------------------------------
resource "azurerm_network_security_group" "databricks_nsg" {
  depends_on = [
    azurerm_subnet.databricks_subnets
  ]
  for_each            = var.dbricks_subnets
  name                = each.value["nsg"]
  location            = var.location
  resource_group_name = var.rg_name
  tags                = var.default_tags
}
#-----------------Creating Network Security Groups Association----------------------------------

resource "azurerm_subnet_network_security_group_association" "nsg_asso" {
  for_each                  = var.dbricks_subnets
  subnet_id                 = azurerm_subnet.databricks_subnets[each.value["name"]].id
  network_security_group_id = azurerm_network_security_group.databricks_nsg[each.value["name"]].id
  depends_on = [
    azurerm_subnet.databricks_subnets,
    azurerm_network_security_group.databricks_nsg
  ]
}
#-----------------------------------------------------------------------------------
