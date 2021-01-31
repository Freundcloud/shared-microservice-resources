resource "azurerm_application_insights" "shared_insights" {
  count               = var.provision_appinsight ? 1 : 0
  name                = "${var.prefix}-${var.environment}-core-appinsights"
  location            = data.azurerm_resource_group.core_rg.location
  resource_group_name = data.azurerm_resource_group.core_rg.name
  application_type    = "web"
}

output "instrumentation_key" {
  value = azurerm_application_insights.shared_insights[0].instrumentation_key
}

output "app_id" {
  value = azurerm_application_insights.shared_insights[0].app_id
}

resource "azurerm_key_vault_secret" "instrumentation_key" {
  count        = var.provision_appinsight ? 1 : 0
  name         = "${var.prefix}-${var.environment}-core-instrumentation-key"
  value        = azurerm_application_insights.shared_insights[0].instrumentation_key
  key_vault_id = data.azurerm_key_vault.kv_core.id

  tags = {
    environment = var.environment
  }
}
