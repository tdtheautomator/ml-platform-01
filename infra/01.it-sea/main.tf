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

module "storage1" {
  source                   = "../00.modules/storage/storage-account"
  rg_name                  = module.resourcegroup.resource-group-name
  location                 = module.resourcegroup.resource-group-location
  default_tags             = local.default_tags
  storage_acc_name         = join("", ["${lookup(local.region_shortname_map, var.location)}", "${var.environment}", "${var.department}", "${var.appname}", local.random_str_1, "sa1", ])
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
  umi_id      = module.dbricks-umi.uai_id
}
