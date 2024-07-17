terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.110.0, < 4.0.1"
    }

  }
  /*   backend "azurerm" {
      resource_group_name  = "module2tfstate002"
      storage_account_name = "module2tfstate002"
      container_name       = "module2tfstate002"
      key                  = "terraform.tfstate"
  } */
  required_version = ">= 1.5.8"
}
