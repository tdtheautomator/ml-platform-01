#----------------------Creating Storage Account----------------------

resource "azurerm_storage_account" "storageacc" {
  name                            = var.storage_acc_name
  location                        = var.location
  resource_group_name             = var.rg_name
  account_kind                    = var.account_kind
  account_tier                    = var.account_tier
  account_replication_type        = var.account_replication_type
  access_tier                     = var.access_tier
  min_tls_version                 = "TLS1_2"
  https_traffic_only_enabled      = true
  allow_nested_items_to_be_public = false
  tags                            = var.default_tags
  is_hns_enabled                  = var.hns_enabled
}
#--------------------------------------------------------------------

resource "azurerm_storage_container" "containers" {
  for_each              = toset(var.containers)
  name                  = each.key
  storage_account_id    = azurerm_storage_account.storageacc.id
  container_access_type = "private"
} 