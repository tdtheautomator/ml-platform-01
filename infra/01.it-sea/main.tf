module "random_str1" {
  source = "../00.modules/core/random"
}

module "resourcegroup" {
  source       = "../00.modules/core/rg"
  rg_name      = "${local.prefix}-rg"
  default_tags = local.default_tags
  location     = var.location
}


module "networking" {
  source             = "../00.modules/networking/net-multi-tier"
  rg_name            = module.resourcegroup.resource-group-name
  location           = module.resourcegroup.resource-group-location
  default_tags       = local.default_tags
  vnet_name          = "${local.prefix}-vnet"
  netwatch_name      = "${local.prefix}-nw"
  vnet_address_space = var.vnet_address_space
  vnet_subnets       = var.vnet_subnets
  depends_on = [
    module.resourcegroup
  ]
}

module "dbricks-umi" {
  source                      = "../00.modules/security/managed-identity"
  rg_name                     = module.resourcegroup.resource-group-name
  location                    = module.resourcegroup.resource-group-location
  default_tags                = local.default_tags
  user_assigned_identity_name = "${local.prefix}-dbricks-umi"
}

module "dbricks-access-connector" {
  source                = "../00.modules/databricks/access-connector"
  rg_name               = module.resourcegroup.resource-group-name
  location              = module.resourcegroup.resource-group-location
  default_tags          = local.default_tags
  access_connector_name = "${local.prefix}-dbricks-acc-conn"
  umi_id                = module.dbricks-umi.uai_id
}

module "dbricks-subnets" {
  source          = "../00.modules/databricks/subnets"
  rg_name         = module.resourcegroup.resource-group-name
  location        = module.resourcegroup.resource-group-location
  default_tags    = local.default_tags
  dbricks_subnets = var.dbricks_subnets
  vnet_name       = module.networking.vnet-name
  depends_on = [
    module.networking
  ]
}


module "dbricks-workspace" {
  source                      = "../00.modules/databricks/workspace"
  dbricks_ws_name             = "${local.prefix}-dbricks-ws"
  dbricks_sku                 = "trial"
  rg_name                     = module.resourcegroup.resource-group-name
  location                    = module.resourcegroup.resource-group-location
  dbricks_access_connector_id = module.dbricks-access-connector.access_connector_id
  dbricks_pub_subnet          = [for k in module.dbricks-subnets.subnets : k][0].name
  dbricks_pvt_subnet          = [for k in module.dbricks-subnets.subnets : k][1].name
  default_tags                = local.default_tags
  vnet_id                     = module.networking.vnet-id
  dbricks_pub_subnet_nsg_id   = [for v in module.dbricks-subnets.databricks_subnet_nsg_id : v][0]
  dbricks_pvt_subnet_nsg_id   = [for v in module.dbricks-subnets.databricks_subnet_nsg_id : v][1]
  depends_on = [
    module.dbricks-subnets
  ]
}

module "dbricks-metastore" {
  source = "../00.modules/databricks/metastore"
  locations = ["southeastasia","westeurope","westus"]
  rg_name                     = module.resourcegroup.resource-group-name
  default_tags                = local.default_tags
 }



module "sales-model" {
  source                 = "../00.modules/databricks/external-models-entra-auth"
  clientId               = var.clientId
  clientSecret           = var.clientSecret
  tenantId               = var.tenantId
  model_serving_name     = "sales-westeurope"
  openai_api_base        = "https://dev-sales-sap-gpt35.openai.azure.com/"
  model_deployment_name  = "gpt-35-turbo"
  openai_deployment_name = "gpt-35-turbo"
  openai_api_version     = "2024-05-01-preview"
  depends_on             = [module.dbricks-workspace]
  providers = {
    databricks.account          = databricks.account
    databricks.model_serving_ws = databricks.model_serving_ws
  }
}

module "sales-model-localauth" {
  source                 = "../00.modules/databricks/external-models-local-auth"
  open_api_key           = var.open_api_key
  model_serving_name     = "sales-westeurope-localauth"
  openai_api_base        = "https://dev-sales-sap-gpt35.openai.azure.com/"
  model_deployment_name  = "gpt-35-turbo"
  openai_deployment_name = "gpt-35-turbo"
  openai_api_version     = "2024-05-01-preview"
  depends_on             = [module.dbricks-workspace]
  providers = {
    databricks.account          = databricks.account
    databricks.model_serving_ws = databricks.model_serving_ws
  }
}



/*

module "uai-metastore" {
  source = "../00.modules/security/managed-identity"
  for_each = local.region_shortname_map
  user_assigned_identity_name = "metastore-uai-${each.value}"
  location = each.key
  rg_name = module.resourcegroup.resource-group-name
  default_tags = merge(local.default_tags,{usage="databricks-metastore"})
}

module "metastore-storage" {
  source                   = "../00.modules/storage/storage-account"
  for_each = local.region_shortname_map
  rg_name                  = module.resourcegroup.resource-group-name
  location                 = each.key
  default_tags             = merge(local.default_tags,{usage="databricks-metastore"})
  storage_acc_name         = join("", ["dbricksmeta", "${each.value}", local.random_str_1])
  account_kind             = var.account_kind
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  access_tier              = var.access_tier
  hns_enabled              = var.hns_enabled
  containers = ["metastore","archive"]
  depends_on = [
    module.resourcegroup,
    module.networking
  ]
}

module "storage1" {
  source                   = "../00.modules/storage/storage-account"
  rg_name                  = module.resourcegroup.resource-group-name
  location                 = module.resourcegroup.resource-group-location
  default_tags             = local.default_tags
  storage_acc_name         = join("", ["${var.environment}", "${var.department}", local.location_short, local.random_str_1, "sa1", ])
  account_kind             = var.account_kind
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  access_tier              = var.access_tier
  hns_enabled              = var.hns_enabled
  depends_on = [
    module.resourcegroup,
    module.networking
  ]
}
*/
