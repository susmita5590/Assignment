resource "azurerm_sql_server" "sample-sql-server" {
    name = var.sql_server_db
    resource_group_name = var.resource_group
    location = var.location
    version = var.sql_server_version
    administrator_login = var.database_admin
    administrator_login_password = var.database_password
	
	tags = {
      environment = "demo"
  }
}

resource "azurerm_sql_database" "sample-db" {
  name                = "sample-db"
  resource_group_name = var.resource_group
  location            = var.location
  server_name         = azurerm_sql_server.sample-sql-server.name
  
  tags = {
    environment = "demo"
  }
}