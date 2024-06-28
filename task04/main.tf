terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.89.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Create Resource group
resource "azurerm_resource_group" "my_RG" {
  name     = var.rg_name
  location = var.rg_location
}

