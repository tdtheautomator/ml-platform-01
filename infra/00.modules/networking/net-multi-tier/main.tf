#-----------------Creating Network Watcher----------------------------------------------

resource "azurerm_network_watcher" "netwatcher" {
  name                = var.netwatch_name
  location            = var.location
  resource_group_name = var.rg_name
  tags                = var.default_tags
}


#-----------------Creating VNet-----------------------------------------------------
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = var.rg_name
  tags                = var.default_tags
}
#-----------------------------------------------------------------------------------

#-----------------Creating Subnets--------------------------------------------------
resource "azurerm_subnet" "subnets" {
  for_each             = var.vnet_subnets
  name                 = each.value["name"]
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = each.value["addr"]
  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

#-----------------------------------------------------------------------------------

#-----------------Creating Network Security Groups----------------------------------
resource "azurerm_network_security_group" "nsg" {
  depends_on = [
    azurerm_subnet.subnets
  ]
  for_each            = var.vnet_subnets
  name                = each.value["nsg"]
  location            = var.location
  resource_group_name = var.rg_name
  tags                = var.default_tags
}
#-----------------Creating Network Security Groups Association----------------------------------

resource "azurerm_subnet_network_security_group_association" "nsg_asso" {
  for_each                  = var.vnet_subnets
  subnet_id                 = azurerm_subnet.subnets[each.value["name"]].id
  network_security_group_id = azurerm_network_security_group.nsg[each.value["name"]].id
  depends_on = [
    azurerm_subnet.subnets,
    azurerm_network_security_group.nsg
  ]
}
#-----------------------------------------------------------------------------------


