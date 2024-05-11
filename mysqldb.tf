provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg4" {
  name     = "flexrg"
  location = "UK West"
}

resource "azurerm_mysql_flexible_server" "rg5" {
  name                   = "flexible-serveri1105"
  resource_group_name    = azurerm_resource_group.rg4.name
  location               = azurerm_resource_group.rg4.location
  administrator_login    = "Dilip"
  administrator_password = "Welcome@123!"
  sku_name               = "B_Standard_B1s"
}

resource "azurerm_mysql_flexible_database" "rg6" {
  name                = "flexdb1105"
  resource_group_name = azurerm_resource_group.rg4.name
  server_name         = azurerm_mysql_flexible_server.rg5.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}
