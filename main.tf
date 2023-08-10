terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.68.0"
    }
  }
}

provider "azurerm" {
  features {}
}

locals {
  location = "uksouth"
  tags = {
    environment = "learn-eks"
  }
}

resource "azurerm_resource_group" "main" {
  name     = "aks"
  location = local.location
  tags     = local.tags
}
