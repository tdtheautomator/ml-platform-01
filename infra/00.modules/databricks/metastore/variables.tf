variable "locations" {
  type    = list(string)
  default = null
}

variable "rg_name" {
  type    = string
  default = null
}

variable "default_tags" {
  type = map(string)
}