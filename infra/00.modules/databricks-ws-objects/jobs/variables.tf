
variable "department" {
  type = string
  default = null
}

variable "appname" {
  type = string
  default = null
}

variable "jobs" {
    type = map(object({
        name = string
        cluster_key = string
        tasks = object({
          task_type = string
          notebook_key = string
          jar_uri = optional(string)
          spark_submit = optional(string)
          task_key = string
        })
    }))
    default = {}
}