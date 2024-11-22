
output "_ResourceGroupName" {
  value = module.resourcegroup.resource-group-name
}
output "_ResourceGroupLocation" {
  value = module.resourcegroup.resource-group-location
}

output "_DatabricksWorkSpaceName" {
  value = module.dbricks-workspace.databricks_workspace_name
}

output "_DatabricksWorkSpaceID" {
  value = module.dbricks-workspace.databricks_workspace_id
}

output "_DatabricksWorkSpaceURL" {
  value = module.dbricks-workspace.databricks_workspace_url
}


/*
output "_MetastoreStorageAccountIds" {
  value = module.dbricks-metastore.metastore-accounts
}


output "_MetastoreStorageAccounts" {
  value = module.metastore-storage[*].storage-account-id
}

output "_MetastoreUserAssignedIdentity" {
  value = module.uai-metastore[*].uai_principal_id
}

output "VNetName" {
  value = module.networking.vnet-name
}

output "DatabricksWorkSpaceID" {
  value = module.dbricks-workspace.databricks_workspace_id
}

output "NSGs" {
  value = module.networking.nsg_id
}


output "DatabricksSubnets" {
  value = module.dbricks-subnets.databricks_subnet_id
}

output "DatabricksNSG" {
  value = module.dbricks-subnets.databricks_subnet_nsg_id
}
*/