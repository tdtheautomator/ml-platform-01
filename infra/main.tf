
module "resourcegroup" {
  source          = "./modules/core/resourcegroup"
  location        = var.location
  department      = var.department
  environment     = var.environment
  appname         = var.appname
  deployment-type = var.deployment-type
}


module "networking" {
  source             = "./modules/networking/net-multi-tier"
  location           = var.location
  department         = var.department
  environment        = var.environment
  appname            = var.appname
  deployment-type    = var.deployment-type
  vnet_address_space = var.vnet_address_space
  vnet_subnets       = var.vnet_subnets
  depends_on = [
    module.resourcegroup
  ]
}

module "storage" {
  source                   = "./modules/storage/storage-account"
  location                 = var.location
  department               = var.department
  environment              = var.environment
  appname                  = var.appname
  account_kind             = var.account_kind
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  access_tier              = var.access_tier
  depends_on = [
    module.resourcegroup,
    module.networking
  ]
}