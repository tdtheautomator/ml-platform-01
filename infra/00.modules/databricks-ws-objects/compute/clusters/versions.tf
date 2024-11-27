terraform {
  required_providers {
    databricks = {
      source                = "databricks/databricks"
      configuration_aliases = [databricks.target_databricks_ws]
      version               = ">=1.58.0"
    }
  }
}
