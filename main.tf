terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.12.0"
    }
  }
}

provider "azurerm" {
  # Configuracion de opciones de conexion
  features {}

  subscription_id   = "02136a8e-9e5e-4b4f-ad2c-9367f3c42853"
  tenant_id         = "a3fd8711fd1340a4a0fba2364b27300d"
  client_id         = "ana.sanchez755@comunidadunir.net"
  client_secret     = ""
}

# crear el grupo de recursos
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
resource "azurerm_resource_group" "rg" {
  name     = "kubernete_rg"
  location = var.location

  tags = {
  	environment = "CP2"
  }	
}

# crear storage 
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account
resource "azurerm_storage_account" "stAccount" {
  name                     = "setaccountcp2"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "CP2"
  }
}