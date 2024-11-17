output "vnet-name" {
  value = azurerm_virtual_network.vnet.name
}

output "vnet-id" {
  value = azurerm_virtual_network.vnet.id
}

output "subnet_id" {
  value = {
    for k, s in azurerm_subnet.subnets : k => s.id
  }
}

output "nsg_id" {
  value = {
    for k, s in azurerm_network_security_group.nsg : k => s.id
  }
}