resource "azurerm_disk_encryption_set" "pike" {
  name                = "des"
  location                  = var.location
  resource_group_name       = var.resource_group_name
  key_vault_key_id    = var.key_vault_key_id

  identity {
    type = "SystemAssigned"
  }
}