
variable "location" {
  type = string
}

variable "rg_name" {
  type    = string
  default = null
}

variable "user_assigned_identity_name" {
  type = string
}

variable "default_tags" {
  type = map(string)
}