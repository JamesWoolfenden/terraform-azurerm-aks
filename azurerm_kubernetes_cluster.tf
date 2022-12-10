resource "azurerm_kubernetes_cluster" "pike" {
  # checkov:skip=CKV_AZURE_7: INVALID
  # checkov:skip=CKV_AZURE_116: INVALID
  name                      = var.aks_name
  location                  = var.location
  resource_group_name       = var.resource_group_name
  dns_prefix                = var.aks_name
  sku_tier                  = var.sku_tier
  automatic_channel_upgrade = var.automatic_channel_upgrade

  default_node_pool {
    name         = var.default_node_pool.name
    node_count   = var.default_node_pool.node_count
    vm_size      = var.default_node_pool.vm_size
    max_pods     = var.default_node_pool.max_pods
    os_disk_type = "ephemeral"
  }

  key_vault_secrets_provider {
    secret_rotation_enabled = var.secret_rotation_enabled
  }

  identity {
    type = "SystemAssigned"
  }

  tags                    = var.tags
  local_account_disabled  = var.local_account_disabled
  private_cluster_enabled = var.private_cluster

  disk_encryption_set_id = azurerm_disk_encryption_set.pike.id

  oms_agent {
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }
  network_profile {
    network_policy = "azure"
    network_plugin = var.network_plugin
  }
  role_based_access_control_enabled = true
}
