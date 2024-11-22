terraform {
  required_providers {
    databricks = {
      source                = "databricks/databricks"
      configuration_aliases = [databricks.account]
      version               = ">=1.58.0"
    }
  }
}
