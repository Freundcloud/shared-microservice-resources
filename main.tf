terraform {
  backend "azurerm" {}
}
provider "azurerm" {
  features {}
}
provider "random" {}
provider "azuread" {}
provider "null" {}

provider "tls" {}

resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-${var.environment}-shared-rg"
  location = var.location
}
