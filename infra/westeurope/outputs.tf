output "ResourceGroupName" {
  value = module.resourcegroup.resource-group-name
}
output "ResourceGroupLocation" {
  value = module.resourcegroup.resource-group-location
}
output "VNetName" {
  value = module.networking.vnet-name
}
output "Subnets" {
  value = module.networking.subnets
}

output "StorageAccount" {
  value = module.storage.storage-account-name
}
