resource "azurerm_servicebus_namespace" "az_servicebus" {
  name                = var.servicebusname
  location            = azurerm_resource_group.env_resource_group.location
  resource_group_name = azurerm_resource_group.env_resource_group.name
  sku                 = "Standard"

  tags = var.tag_map

}

resource "azurerm_servicebus_queue" "az_servicebus_queue_one" {
  name         = var.servicebusquenameone
  namespace_id = azurerm_servicebus_namespace.az_servicebus.id

  enable_partitioning = true
}

resource "azurerm_servicebus_queue" "az_servicebus_queue_two" {
  name         = var.servicebusquenametwo
  namespace_id = azurerm_servicebus_namespace.az_servicebus.id

  enable_partitioning = true
}