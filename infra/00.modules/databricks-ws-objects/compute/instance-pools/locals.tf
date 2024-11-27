locals {
  default_tags = {
    department      = lower(var.department)
    appname         = lower(var.appname)
  }
}