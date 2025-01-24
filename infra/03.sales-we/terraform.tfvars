# -------------------------Common Inputs----------
location    = "westeurope"
environment = "dev"
department  = "sales"
appname     = "sap"
# -------------------------------------------------

#------------------Networking Inputs---------------
vnet_address_space = ["10.11.0.0/22"]

vnet_subnets = {
  tier1 = {
    name = "tier1"
    addr = ["10.11.0.128/25"]
    nsg  = "tier1-nsg"
  }
  tier2 = {
    name = "tier2"
    addr = ["10.11.1.0/24"]
    nsg  = "tier2-nsg"
  }
  tier3 = {
    name = "tier3"
    addr = ["10.11.2.0/24"]
    nsg  = "tier3-nsg"
  }

}
#--------------------------------------------------
