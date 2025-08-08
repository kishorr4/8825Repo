resource "azurerm_resource_group" "Raj-rg" {
  name     = "tolu"
  location = "eastus"
}
resource "azurerm_storage_account" "tolukastorage" {
  name                     = "tolukastorage"
  resource_group_name      = azurerm_resource_group.Raj-rg.name
  location                 = azurerm_resource_group.Raj-rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
resource "azurerm_virtual_network" "tolukavnet" {
  name                = "tolukavnet"
  resource_group_name = azurerm_resource_group.Raj-rg.name
  location            = azurerm_resource_group.Raj-rg.location
  address_space       = ["10.0.0.0/16"]
}
resource "azurerm_subnet" "tolukasubnet" {
  name                 = "tolukasubnet"
  resource_group_name  = azurerm_resource_group.Raj-rg.name
  virtual_network_name = azurerm_virtual_network.tolukavnet.name
  address_prefixes     = ["10.0.1.0/24"]

}

#ABC