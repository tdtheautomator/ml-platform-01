#----------------------Random----------------------
resource "random_string" "randomstr" {
  length  = 3
  lower   = true
  numeric = false
  upper   = false
  special = false
}

resource "random_integer" "randomint" {
  min = 001
  max = 999
}

locals {
  region_shortname_map = {
    westeurope    = "we"
    westus        = "wus"
    southeastasia = "sea"
  }

  random                    = join("", [random_string.randomstr.result, random_integer.randomint.result])
  storage_account_ids       = [for s in azurerm_storage_account.storageacc : s.id]
  location_account_name_map = { for region, sa in azurerm_storage_account.storageacc : region => sa.name }
  location_account_id_map   = { for region, sa in azurerm_storage_account.storageacc : region => sa.id }
  location_uai_map          = { for region, uai in azurerm_user_assigned_identity.uai : region => uai.principal_id }

  uai_account_id_map = {
    for region, sa in local.location_account_id_map :
    sa => lookup(local.location_uai_map, region)
  }

}

