output "storage_container_names" {
  value = azurerm_storage_container.containers[*].name
}