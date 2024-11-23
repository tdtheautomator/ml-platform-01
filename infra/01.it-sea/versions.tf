terraform {
  required_providers {
    databricks = {
      source                = "databricks/databricks"
      configuration_aliases = [databricks.account, databricks.model_serving_ws]
      version               = ">=1.58.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">=3.6.3"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.1.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = ">=3.0.2"
    }
  }
}
