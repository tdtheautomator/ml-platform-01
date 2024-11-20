variable "task_type" {
  type    = string
  default = "llm/v1/completions"
}

variable "model_serving_name" {}
variable "model_deployment_name" {}
variable "openai_api_base" {}
variable "openai_api_version" {}
variable "openai_deployment_name" {}
variable "openai_organization" {
  default = null
}

variable "open_api_key" {}
