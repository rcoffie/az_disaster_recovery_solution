
resource "azurerm_resource_group" "primary" {
  name     = var.primary_resource_group_name
  location = var.primary_location
}

resource "azurerm_resource_group" "secondary" {
  name     = var.secondary_resource_group_name
  location = var.secondary_location
}