module "random_str1" {
  source = "../00.modules/core/random"
}

module "entra_groups" {
  source = "../00.modules/entra/groups"
  groups = local.entra_groups
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

