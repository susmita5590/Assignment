resource "azurerm_virtual_network" "sample-vnet" {
  name                = "sample-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group
}

resource "azurerm_subnet" "sample-web-subnet" {
  name                 = "sample-web-subnet"
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.sample-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "sample-app-subnet" {
  name                 = "sample-app-subnet"
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.sample-vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "sample-db-subnet" {
  name                 = "sample-db-subnet"
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.sample-vnet.name
  address_prefixes     = ["10.0.3.0/24"]
}