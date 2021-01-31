variable "tenant_id" {
  type        = string
  description = "Azure Tenant Id"
}

variable "environment" {
  default = "sbx"
}

variable "prefix" {
  default = "aks-demo"
}

variable "domain" {}

variable "location" {
  description = "Location of the cluster."
  default     = "uksouth"
}

variable "acrname" {
  default = "sbxacrfc"
}

variable "tags" {
  type = map(string)

  default = {
    source = "terraform"
  }
}


variable "provision_appinsight" {
  default = true
}
