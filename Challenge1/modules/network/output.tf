output "network_name" {
  description = "Virtual Network name"
  value = azurerm_virtual_network.sample-vnet.name
}


output "web_subnet_id" {
  description = "WEB subnet ID"
  value = azurerm_subnet.sample-web-subnet.id
}


output "app_subnet_id" {
  description = "APP subnet ID"
  value = azurerm_subnet.sample-app-subnet.id
}


output "db_subnet_id" {
  description = "DB subnet ID"
  value = azurerm_subnet.sample-db-subnet.id
}