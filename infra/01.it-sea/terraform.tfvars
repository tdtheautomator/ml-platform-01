# -------------------------Common Inputs---------
location    = "southeastasia"
environment = "dev"
department  = "it"
appname     = "support"
# -----------------------------------------------


#------------------Networking Inputs---------------
vnet_address_space = ["10.9.0.0/22"]

vnet_subnets = {
  tier1 = {
    name = "tier1"
    addr = ["10.9.0.128/25"]
    nsg  = "tier1-nsg"
  }
  tier2 = {
    name = "tier2"
    addr = ["10.9.1.0/24"]
    nsg  = "tier2-nsg"
  }
  tier3 = {
    name = "tier3"
    addr = ["10.9.2.0/24"]
    nsg  = "tier3-nsg"
  }

}
dbricks_subnets = {
  databricks-pub = {
    name = "databricks-pub"
    addr = ["10.9.3.0/25"]
    nsg  = "databricks-pub-nsg"
  }
  databricks-pvt = {
    name = "databricks-pvt"
    addr = ["10.9.3.128/25"]
    nsg  = "databricks-pvt-nsg"
  }
}
#--------------------------------------------------

#------------------Storage Inputs---------------
account_kind             = "StorageV2"
account_tier             = "Standard"
account_replication_type = "LRS"
access_tier              = "Hot"
hns_enabled              = true
#--------------------------------------------------

#------------------Notebook Inputs---------------
notebooks = {
  "default_python_notebook" = {
    content  = "# Default Python Notebook"
    path     = "/it/support/default_python_notebook"
    language = "PYTHON"
  },
  "default_r_notebook" = {
    content  = "# Default R Notebook"
    path     = "/it/support/default_r_notebook"
    language = "R"
  },
  "default_sql_notebook" = {
    content  = "-- Default SQL Notebook"
    path     = "/it/support/default_sql_notebook"
    language = "SQL"
  }
}
#--------------------------------------------------

#------------------Cluster Policy---------------

cluster_policy = {
  "custom_shared_compute" = {
    name        = "Custom Shared Compute"
    description = "Custom Shared Compute"
    policy_definition = {
      "spark_conf.spark.databricks.cluster.profile" : {
        "type" : "forbidden",
        "hidden" : true
      },
      "spark_version" : {
        "type" : "unlimited",
        "defaultValue" : "auto:latest-lts"
      },
      "autotermination_minutes" : {
        "type" : "unlimited",
        "defaultValue" : 0,
        "isOptional" : true
      },
      "node_type_id" : {
        "type" : "unlimited",
        "defaultValue" : "Standard_DS3_v2",
        "isOptional" : true
      },
      "autoscale.min_workers" : {
        "type" : "unlimited",
        "defaultValue" : 2
      },
      "autoscale.max_workers" : {
        "type" : "unlimited",
        "defaultValue" : 10
      },
      "num_workers" : {
        "type" : "forbidden",
        "hidden" : true
      },
      "azure_attributes.availability" : {
        "type" : "unlimited",
        "defaultValue" : "ON_DEMAND_AZURE"
      },
      "azure_attributes.spot_bid_max_price" : {
        "type" : "fixed",
        "value" : -1,
        "hidden" : true
      },
      "instance_pool_id" : {
        "type" : "forbidden",
        "hidden" : true
      },
      "driver_instance_pool_id" : {
        "type" : "forbidden",
        "hidden" : true
      },
      "cluster_type" : {
        "type" : "fixed",
        "value" : "all-purpose"
      },
      "data_security_mode" : {
        "type" : "fixed",
        "value" : "USER_ISOLATION",
        "hidden" : true
      }
    }
  }
}

#--------------------------------------------------

#------------------Cluster Policy Override---------------
# Refer : https://learn.microsoft.com/en-us/azure/databricks/admin/clusters/policy-definition
cluster_policy_override = {
  "cluster_policy_override_1" = {
    definition_overrides = {
      "autotermination_minutes" : {
        "type" : "unlimited",
        "defaultValue" : 4320,
        "isOptional" : true
      },/*
      "instance_pool_id" : {
        "type" : "forbidden",
        "hidden" : true
      },*/
      "runtime_engine" : {
        "type" : "fixed",
        "value" : "PHOTON",
        "hidden" : true
      },
      /*"node_type_id" : {
        "type" : "fixed",
        "value" : "Standard_DS3_v2"
      },*/
      "autoscale.min_workers" : {
        "type" : "fixed",
        "value" : 1,
        "hidden" : true
      },
      "autoscale.max_workers" : {
        "type" : "fixed",
        "value" : 3,
      },
      "num_workers" : {
        "type" : "forbidden",
        "hidden" : true
      },
      "autotermination_minutes" : {
        "type" : "fixed",
        "value" : 30,
        "hidden" : true
      }
    }
  }
}
#--------------------------------------------------

#------------------Instance Pools---------------
instance_pools = {
  "auto_scaling" = {
    instance_pool_name  = "auto_scaling_instance_pool"
    min_idle_instances  = 0
    max_capacity        = "2"
    node_type_id        = "Standard_DS3_v2"
    enable_elastic_disk = true
    azure_attributes = {
      availability       = "ON_DEMAND_AZURE"
      spot_bid_max_price = "-1"
    }
    idle_instance_autotermination_minutes = 30
    preloaded_spark_versions              = ["15.4.x-scala2.12"]
    disk_spec = {
      azure_disk_volume_type = "STANDARD_LRS"
      disk_size              = 500
      disk_count             = 1
    }
    custom_tags = {}
  }/*,
  "single_node" = {
    instance_pool_name  = "single_node_instance_pool"
    min_idle_instances  = "1"
    max_capacity        = "1"
    node_type_id        = "Standard_DS3_v2"
    enable_elastic_disk = true
    azure_attributes = {
      availability       = "ON_DEMAND_AZURE"
      spot_bid_max_price = 0
    }
    idle_instance_autotermination_minutes = 30
    preloaded_spark_versions              = ["15.4.x-scala2.12"]
    disk_spec = {
      azure_disk_volume_type = "STANDARD_LRS",
      disk_size              = 500,
      disk_count             = 1
    }
    custom_tags = {}
  }*/
}

#--------------------------------------------------

#------------------Clusters---------------

clusters = {
  "single_node_cluster" = {
    cluster_name            = "single_node_cluster"
    spark_version           = "15.4.x-scala2.12"
    node_type_id            = "Standard_DS3_v2"
    autotermination_minutes = 30
    autoscale_min_workers    = 1
    autoscale_max_workers   = 2
    num_workers             = 0
    cluster_mode            = "single_node"
    spark_conf = {
      "spark.databricks.cluster.profile" : "singleNode",
      "spark.master" : "local[*]"
    }
    azure_attributes = {
      availability       = "ON_DEMAND_AZURE"
      spot_bid_max_price = "-1"
      first_on_demand    = 1
    }
    custom_tags = {
      "ResourceClass" = "SingleNode"
    }
    use_instance_pool_id         = false
    data_security_mode           = "SINGLE_USER"
    enable_elastic_disk          = true
    enable_local_disk_encryption = false
    instance_pool_key            = null
    single_user_name             = "DataEngineer"
  }
}

#--------------------------------------------------
