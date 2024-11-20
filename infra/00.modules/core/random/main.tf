resource "random_string" "randomstr" {
  length  = 3
  lower   = true
  numeric = false
  upper   = false
  special = false
}

resource "random_integer" "randomint" {
  min = 001
  max = 999
}