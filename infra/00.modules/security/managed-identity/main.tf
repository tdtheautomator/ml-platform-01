resource "azurerm_user_assigned_identity" "uai" {
  location            = var.location
  name                = var.user_assigned_identity_name
  resource_group_name = var.rg_name
  tags = var.default_tags
}