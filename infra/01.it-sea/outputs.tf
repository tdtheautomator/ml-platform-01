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

output "StorageAccount1" {
  value = module.storage1.storage-account-name
}
