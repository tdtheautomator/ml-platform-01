#--------------Common Variables--------------------------------
variable "location" {
  type = string
}

variable "rg_name" {
  type    = string
  default = null
}

variable "default_tags" {
  type = map(string)
}

#-----------------------------------------------------------

variable "storage_acc_name" {
  type    = string
}

variable "account_kind" {
  type    = string
  default = "StorageV2"
}

variable "account_tier" {
  type    = string
  default = "Standard"
}

variable "account_replication_type" {
  type    = string
  default = "LRS"
}


variable "access_tier" {
  type    = string
  default = "Hot"
}

variable "hns_enabled" {
  type    = bool
  default = false
}

#-----------------------------------------------------------