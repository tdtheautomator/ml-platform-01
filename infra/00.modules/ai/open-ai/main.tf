resource "azurerm_cognitive_account" "cognitive_acount" {
  name                               = var.cognitive_acount_name
  location                           = var.location
  resource_group_name                = var.rg_name
  sku_name                           = var.cognitive_acount_sku
  kind                               = var.cognitive_acount_kind
  dynamic_throttling_enabled         = var.dynamic_throttling_enabled
  fqdns                              = var.allowed_fqdns
  local_auth_enabled                 = true
  custom_subdomain_name              = var.custom_subdomain_name
  outbound_network_access_restricted = var.outbound_network_access_restricted
  public_network_access_enabled      = var.public_network_access_enabled
  tags                               = var.default_tags

  identity {
    type = "SystemAssigned"
  }
  /*
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
 */
  timeouts {
    create = "2h"
    update = "1h"
    delete = "1h"
  }
}

resource "azurerm_cognitive_deployment" "cognitive_deployment" {
  for_each               = var.cognitive_deployment
  cognitive_account_id   = azurerm_cognitive_account.cognitive_acount.id
  name                   = each.value.cognitive_deployment_name
  rai_policy_name        = each.value.rai_policy_name
  version_upgrade_option = each.value.version_upgrade_option
  model {
    format  = each.value.model_format
    name    = each.value.model_name
    version = each.value.model_version

  }
  sku {
    name     = each.value.deployment_sku_name
    capacity = each.value.deployment_sku_capacity
  }

}