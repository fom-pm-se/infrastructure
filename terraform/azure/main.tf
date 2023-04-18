resource "azurerm_resource_group" "resource_group" {
  for_each = var.environments
  location = each.value.location
  name     = "fom-pm-se-${each.value.name}-rg"
  tags = {
    Environment = each.value.name
  }
}

resource "azurerm_kubernetes_cluster" "kubernetes_cluster" {
  for_each            = var.environments
  location            = each.value.location
  name                = "fom-pm-se-${each.value.name}-aks"
  resource_group_name = azurerm_resource_group.resource_group[each.key].name
  dns_prefix          = "${each.value.name}aks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = each.value.name
  }
}