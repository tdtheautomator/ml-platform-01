resource "databricks_model_serving" "external_model" {
  provider = databricks.model_serving_ws
  name = var.model_serving_name
  config {
    served_entities {
        external_model {
            name = var.model_deployment_name
            provider = "openai"
            task = var.task_type
          openai_config {
            openai_api_type = "azure"
            openai_api_key_plaintext = var.open_api_key
            openai_api_base = var.openai_api_base
            openai_api_version = var.openai_api_version
            openai_deployment_name = var.openai_deployment_name
            openai_organization = var.openai_organization
          }
        }
    }
  }
}
