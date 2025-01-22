resource "random_string" "storage_account_suffix" {
  length  = 6
  special = false
  upper   = false
}


resource "azurerm_storage_account" "primary" {
  name                     = "primary${random_string.storage_account_suffix.result}"
  location                 = azurerm_resource_group.primary.location
  resource_group_name      = azurerm_resource_group.primary.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}