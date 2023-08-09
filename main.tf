terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.68.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = "aks"
  location = local.location
}

locals {
  location = "uksouth"
  tags = {
    environment = "learn-eks"
  }
}