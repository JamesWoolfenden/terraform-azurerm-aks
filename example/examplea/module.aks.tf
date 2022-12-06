module "example" {
  source      = "../../"
  tags = {
    pike="permissions"
  }
  default_node_pool ={
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
    max_pods   = 50
  }
  location = "uksouth"
  resource_group_name = "pike"
  key_vault_key_id= data.azurerm_key_vault_key.pike.id
  log_analytics_workspace_id = "/subscriptions/037ce662-dfc1-4b8b-a8a7-6c414b540ed6/resourcegroups/pike/providers/microsoft.operationalinsights/workspaces/pike"
}

data "azurerm_key_vault_key" "pike" {
  name         = "pike"
  key_vault_id = "/subscriptions/037ce662-dfc1-4b8b-a8a7-6c414b540ed6/resourceGroups/pike/providers/Microsoft.KeyVault/vaults/pike"
}