
variable "department" {
  type = string
  default = null
}

variable "appname" {
  type = string
  default = null
}

variable "notebooks" {
    type = map(object({
        content = string
        path = string
        language = string
    }))
    default = {}
}