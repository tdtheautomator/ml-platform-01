variable "location" {
  type = string
}

variable "rg_name" {
  type    = string
  default = null
}


variable "default_tags" {
  type    = map(string)
  default = null
}
