#----------------------User Assigned Identity----------------------
resource "azurerm_user_assigned_identity" "uai" {
  for_each            = toset(var.locations)
  location            = each.key
  name                = "metastore-uai-${lookup(local.region_shortname_map, each.key)}"
  resource_group_name = var.rg_name
  tags                = var.default_tags
}

#----------------------Creating Storage Account----------------------

resource "azurerm_storage_account" "storageacc" {
  for_each                        = toset(var.locations)
  name                            = join("", ["dbricksmeta", "${lookup(local.region_shortname_map, each.key)}", local.random])
  location                        = each.key
  resource_group_name             = var.rg_name
  account_kind                    = "StorageV2"
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  access_tier                     = "Hot"
  min_tls_version                 = "TLS1_2"
  https_traffic_only_enabled      = true
  allow_nested_items_to_be_public = false
  tags                            = merge(var.default_tags, { usage = "databricks-metastore" })
  is_hns_enabled                  = true
}

#---------------------- Containers ----------------------

resource "azurerm_storage_container" "metastore" {
  for_each              = toset(local.storage_account_ids)
  name                  = "metastore"
  storage_account_id    = each.key
  container_access_type = "private"
  depends_on            = [azurerm_storage_account.storageacc]
}

#---------------------- Role Assignment ----------------------
resource "azurerm_role_assignment" "role_assignment" {
  for_each             = local.uai_account_id_map
  scope                = each.key
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = each.value
}

#----------------------Metastore----------------------
resource "databricks_metastore" "metastore" {
  for_each      = local.location_account_name_map
  provider      = databricks.account
  name          = "metastore_${each.key}"
  storage_root  = format("abfss://%s@%s.dfs.core.windows.net/", "metastore", each.value)
  region        = each.key
  force_destroy = true
}
#--------------------------------------------------------------------