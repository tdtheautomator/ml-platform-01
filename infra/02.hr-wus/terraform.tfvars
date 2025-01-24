# -------------------------Common Inputs-----------
location    = "westus"
environment = "dev"
department  = "hr"
appname     = "payroll"
# -------------------------------------------------


#------------------Networking Inputs---------------
vnet_address_space = ["10.10.0.0/22"]

vnet_subnets = {
  tier1 = {
    name = "tier1"
    addr = ["10.10.0.128/25"]
    nsg  = "tier1-nsg"
  }
  tier2 = {
    name = "tier2"
    addr = ["10.10.1.0/24"]
    nsg  = "tier2-nsg"
  }
  tier3 = {
    name = "tier3"
    addr = ["10.10.2.0/24"]
    nsg  = "tier3-nsg"
  }

}

#--------------------------------------------------