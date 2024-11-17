resource "azurerm_storage_container" "containers" {
    for_each = toset(var.containers)
    name = each.key 
    storage_account_id = var.storage_account_id
    container_access_type = "private"
 } 