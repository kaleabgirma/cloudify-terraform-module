terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm",
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "MyTerraformRG"
  location = "westeurope"
}


resource "azurerm_virtual_network" "vnet" {
    name = "MyTerraformNetwork"
    address_space = ["10.10.0.0/24"]
    location = "westeurope"
    resource_group_name = azurerm_resource_group.rg.name

    tags = {
        Environment = "Test For terraform scropt"
        Team  = "DevOps"
    }
}