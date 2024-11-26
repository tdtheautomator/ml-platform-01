
variable "department" {
  type = string
  default = null
}

variable "appname" {
  type = string
  default = null
}

variable "pipelines" {
  type = map(object({
    name             = string
    configuration    = map(string)
    edition          = string
    continuous       = bool
    development      = bool
    photon           = bool
    channel          = string
    email_recepients = list(string)
    alerts           = list(string)
    notebook_key     = string
    cluster = object({
      label       = string
      num_workers = number
      custom_tags = map(string)
    })
  }))
  default = {}
}