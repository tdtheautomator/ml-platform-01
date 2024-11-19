resource "azurerm_search_service" "ai_search" {
  name                          = var.ai_search_name
  location                      = var.location
  resource_group_name           = var.rg_name
  sku                           = var.ai_search_sku
  replica_count                 = var.replica_count
  partition_count               = var.partition_count
  allowed_ips                   = var.allowed_cidrs
  local_authentication_enabled  = true
  hosting_mode                  = var.hosting_mode
  public_network_access_enabled = var.public_network_access_enabled
  tags                          = var.default_tags
  identity {
    type = "SystemAssigned"
  }
}