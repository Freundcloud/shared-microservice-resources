data "azurerm_resource_group" "core_rg" {
  name = "${var.prefix}-${var.environment}-core-rg"
}

data "azurerm_key_vault" "aks_keyvault" {
  name                = "${var.prefix}-${var.environment}-kv"
  resource_group_name = "${var.prefix}-${var.environment}-aks-rg"
}

data "azurerm_resource_group" "core" {
  name = "${var.prefix}-${var.environment}-core-rg"
}

data "azurerm_subscription" "current" {}
data "azurerm_client_config" "current" {}

data "azurerm_key_vault" "kv_core" {
  name                = "${var.prefix}-${var.environment}-lz-kv"
  resource_group_name = "${var.prefix}-${var.environment}-core-rg"