locals {
  default_tags = {
    department      = lower(var.department)
    environment     = lower(var.environment)
    appname         = lower(var.appname)
    deployment-type = lower(var.deployment-type)
  }

  region_shortname_map = {
    westeurope    = "we"
    westus        = "wus"
    southeastasia = "sea"
  }

  prefix         = lower(join("-", ["${var.environment}", "${var.department}", "${var.appname}"]))
  location_short = lookup(local.region_shortname_map, var.location)
  random_str_1   = module.random_str1.output

  dbricks_pub_subnet_nsg_name = "${local.prefix}-vnet-databricks-pub-nsg"
  dbricks_pvt_subnet_nsg_name = "${local.prefix}-vnet-databricks-pvt-nsg"
}