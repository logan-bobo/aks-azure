resource "azurerm_kubernetes_cluster" "main" {
  name                = "main"
  location            = local.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = "main"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = local.tags
}