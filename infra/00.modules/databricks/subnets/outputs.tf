output "databricks_subnet_id" {
  value = {
    for k, s in azurerm_subnet.databricks_subnets : k => s.id
  }
}

output "databricks_subnet_nsg_id" {
  value = {
    for k, s in azurerm_network_security_group.databricks_nsg : k => s.id
  }
}

output "subnets" {
  value = azurerm_subnet.databricks_subnets
}