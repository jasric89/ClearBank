resource "azurerm_resource_group" "env_resource_group" {
  name     = var.resource_group_name
  location = var.rg_location
}