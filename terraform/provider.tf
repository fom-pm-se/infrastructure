terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "tf-backend"
    storage_account_name = "fompmsesa"
    container_name = "fompmsesa"
    key = "terraform.tfstate"
  }
}
provider "azurerm" {
  features {}
}