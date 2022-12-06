variable "tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map(any)
}


variable "default_node_pool" {
  type = object({
    name       = string
    node_count = number
    vm_size    = string
    max_pods   = number
  })
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "automatic_channel_upgrade" {
  type    = string
  default = "stable"
}

variable "secret_rotation_enabled" {
  type    = bool
  default = true
}


variable "sku_tier" {
  type    = string
  default = "Paid"
}

variable "local_account_disabled" {
  type    = bool
  default = true
}

variable "private_cluster" {
  type    = bool
  default = true
}

variable "key_vault_key_id" {
  type = string
}