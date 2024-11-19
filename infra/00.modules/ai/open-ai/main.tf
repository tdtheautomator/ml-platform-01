resource "azurerm_cognitive_account" "cognitive_acount" {
  name                               = var.cognitive_acount_name
  location                           = var.location
  resource_group_name                = var.rg_name
  sku_name                           = var.cognitive_acount_sku
  kind                               = var.cognitive_acount_kind
  dynamic_throttling_enabled         = var.dynamic_throttling_enabled
  fqdns                              = var.allowed_fqdns
  local_auth_enabled                 = true
  outbound_network_access_restricted = var.outbound_network_access_restricted
  public_network_access_enabled      = var.public_network_access_enabled
  tags                               = var.default_tags

  network_acls {
    default_action = "Deny"
    ip_rules       = var.allowed_cidrs
    dynamic "virtual_network_rules" {
      for_each = var.virtual_network_rules
      content {
        subnet_id                            = virtual_network_rules.value.subnet_id
        ignore_missing_vnet_service_endpoint = virtual_network_rules.value.ignore_missing_vnet_service_endpoint
      }
    }
  }
  timeouts {
    create = "2h"
    update = "1h"
    delete = "1h"
  }
}