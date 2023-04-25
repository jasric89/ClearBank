resource "azurerm_management_lock" "resource-group-level" {
  name       = var.resourcelockname
  scope      = azurerm_resource_group.env_resource_group.id
  lock_level = "ReadOnly"
  notes      = "This Resource Group is Read-Only"
  depends_on = [
    azurerm_servicebus_queue.az_servicebus_queue_one,
    azurerm_servicebus_queue.az_servicebus_queue_two,
    azurerm_servicebus_namespace.az_servicebus,
    azurerm_kubernetes_cluster.jc_aks_env,
    azurerm_kubernetes_cluster_node_pool.jc_node_pool,
  ]
}