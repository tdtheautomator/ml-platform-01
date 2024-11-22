resource "azuread_group" "entra_group" {
    for_each = toset(var.groups)
    display_name = each.key
    security_enabled = true
}