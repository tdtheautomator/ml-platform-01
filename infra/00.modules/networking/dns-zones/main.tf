resource "azurerm_private_dns_zone" "dns_zones" {
  for_each            = toset(var.dns_zones)
  name                = each.key
  resource_group_name = var.rg_name
}