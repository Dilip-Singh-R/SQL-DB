provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg7" {
  name     = "postrg1105"
  location = "West Europe"
}

resource "azurerm_postgresql_server" "rg8" {
  name                = "postgresqlserver110524"
  location            = azurerm_resource_group.rg7.location
  resource_group_name = azurerm_resource_group.rg7.name

  sku_name = "B_Gen5_2"

  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  administrator_login          = "Dilipraj"
  administrator_login_password = "Welcome@123!"
  version                      = "9.5"
  ssl_enforcement_enabled      = true
}

resource "azurerm_postgresql_database" "example" {
  name                = "exampledb"
  resource_group_name = azurerm_resource_group.rg7.name
  server_name         = azurerm_postgresql_server.rg8.name
  charset             = "UTF8"
  collation           = "English_United States.1252"

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}
