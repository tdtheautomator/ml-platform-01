provider "azurerm" {
  features {
    cognitive_account {
      purge_soft_delete_on_destroy = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
  subscription_id = var.target_sub
}

provider "databricks" {
  alias      = "account"
  host       = "http://accounts.azuredatabricks.net"
  account_id = var.databricks_account_id
  auth_type  = "azure-cli"
  #azure_client_id = var.clientId
  #azure_client_secret = var.clientSecret
  #azure_tenant_id = var.tenantId
}

provider "databricks" {
  alias     = "model_serving_ws"
  host      = var.model_serving_workspace
  auth_type = "azure-cli"
  #azure_client_id = var.clientId
  #azure_client_secret = var.clientSecret
  #azure_tenant_id = var.tenantId
}
