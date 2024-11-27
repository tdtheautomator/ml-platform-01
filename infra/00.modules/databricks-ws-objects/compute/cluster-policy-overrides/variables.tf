variable "department" {
  type    = string
  default = null
}

variable "appname" {
  type    = string
  default = null
}

variable "builtin_policy_name" {
  type = string
  default = "Personal Compute"
}

variable "cluster_policy_override" {
  type = map(object({
    definition_overrides = any
  }))
  default = {}
}
