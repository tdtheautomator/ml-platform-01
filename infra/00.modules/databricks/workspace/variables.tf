variable "dbricks_pub_subnet" {
  type = string
}

variable "dbricks_pub_subnet_nsg_id" {
  type    = string
  default = null
}

variable "dbricks_pvt_subnet" {
  type = string

}

variable "dbricks_pvt_subnet_nsg_id" {
  type    = string
  default = null
}

variable "vnet_id" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}
variable "dbricks_sku" {
  type = string
}

variable "default_tags" {
  type    = map(string)
  default = null
}

variable "dbricks_access_connector_id" {
  type = string

}
variable "dbricks_ws_name" {
  type = string
}

variable "assigned_metastores" {
  type = list(string)
  default = null
}