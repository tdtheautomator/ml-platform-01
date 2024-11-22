terraform {
  required_providers {
    databricks = {
      source                = "databricks/databricks"
      configuration_aliases = [databricks.account, databricks.model_serving_ws]
      version               = ">=1.58.0"
    }
  }
}
