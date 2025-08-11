resource "azurerm_resource_group" "Raj-rg1" {
  name     = "tolu1"
  location = "eastus"
}
resource "azurerm_storage_account" "tolukastorage1" {
  name                     = "tolukastorage1"
  resource_group_name      = azurerm_resource_group.Raj-rg1.name
  location                 = azurerm_resource_group.Raj-rg1.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
resource "azurerm_virtual_network" "tolukavnet1" {
  name                = "tolukavnet1"
  resource_group_name = azurerm_resource_group.Raj-rg1.name
  location            = azurerm_resource_group.Raj-rg1.location
  address_space       = ["10.0.0.0/16"]
}
resource "azurerm_subnet" "tolukasubnet1" {
  name                 = "tolukasubnet1"
  resource_group_name  = azurerm_resource_group.Raj-rg1.name
  virtual_network_name = azurerm_virtual_network.tolukavnet1.name
  address_prefixes     = ["10.0.1.0/24"]
}
