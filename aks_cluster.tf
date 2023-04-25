resource "azurerm_kubernetes_cluster" "jc_aks_env" {
  name                = var.aks_name
  location            = azurerm_resource_group.env_resource_group.location
  resource_group_name = azurerm_resource_group.env_resource_group.name
  dns_prefix          = "${var.aks_name}-dnsname"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = var.environment
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "jc_node_pool" {
  name                  = var.aks_nodepool
  kubernetes_cluster_id = azurerm_kubernetes_cluster.jc_aks_env.id
  vm_size               = "Standard_DS2_v2"
  node_count            = 1

  tags = {
    Environment = var.environment
  }
}