variable "location" {
  type = string
}

variable "rg_name" {
  type    = string
  default = null
}

variable "default_tags" {
  type = map(string)
  default = null
}

variable "access_connector_name" {
  type    = string
}

variable "umi_id" {
  type    = string
}