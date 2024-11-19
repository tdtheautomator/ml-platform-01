# ----- Common Variables--------------
variable "location" {
  type = string
}

variable "environment" {
  type = string
}


variable "department" {
  type = string
}

variable "appname" {
  type = string
}

variable "deployment-type" {
  type    = string
  default = "terraform"
}

# ----- Networking ------------------
variable "vnet_address_space" {
  type = list(string)
}

variable "vnet_subnets" {
}

# -----------------------------------
