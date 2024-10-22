#----------------------Creating Storage Account----------------------

resource "azurerm_storage_account" "storageacc" {
  name                            = local.storage_acc_prefix
  location                        = var.location
  resource_group_name             = local.rg_name
  account_kind                    = var.account_kind
  account_tier                    = var.account_tier
  account_replication_type        = var.account_replication_type
  access_tier                     = var.access_tier
  min_tls_version                 = "TLS1_2"
  https_traffic_only_enabled      = true
  allow_nested_items_to_be_public = false
  tags                            = local.default_tags
}
#--------------------------------------------------------------------