resource "azurerm_kubernetes_cluster" "main" {
  name                = "main"
  location            = local.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = "main"

  default_node_pool {
    name           = "system"
    node_count     = 1
    vm_size        = "Standard_D2_v2"
    vnet_subnet_id = azurerm_subnet.main.id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    service_cidr   = "10.0.2.0/24"
    dns_service_ip = "10.0.2.10"
  }

  tags = local.tags
}