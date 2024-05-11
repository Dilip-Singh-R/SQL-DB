# Provider configuration
provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "rg1" {
  name     = "tfsql"
  location = "West US"
}

# SQL Server
resource "azurerm_mssql_server" "rg2" {
  name                         = "sqlserver110524"
  resource_group_name          = azurerm_resource_group.rg1.name
  location                     = azurerm_resource_group.rg1.location
  version                      = "12.0" # Choose the appropriate version
  administrator_login          = "sqladmin"
  administrator_login_password = "Password123!" # Replace with your desired password
}

resource "azurerm_mssql_database" "rg3" {
  name      = "sqldatabase11052024"
  server_id = azurerm_mssql_server.rg2.id
}
