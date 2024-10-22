#----------------------Randoms-----------------------------------
resource "random_string" "randomstr" {
  length  = 8
  numeric  = false
  upper   = false
  special = false
}
resource "random_uuid" "randomuuid" {
}
resource "random_integer" "randomint" {
  min = 111
  max = 999
}
locals {
    default_tags = {
    department  = lower(var.department)
    environment = lower(var.environment)
    appname  = lower(var.appname)
    deployment-type = lower(var.deployment-type)
  }
  prefix    = lower(join("-",["${var.environment}","${var.department}","${var.appname}"]))
  rg_name = var.rg_name != null ? var.rg_name : "${local.prefix}-rg"
  storage_acc_prefix = join("", ["sa", "${var.environment}","${var.department}","${var.appname}",random_integer.randomint.result])
}  
