output "resource_group_name" {
    description = "Resource Group Name"
    value = azurerm_resource_group.sample-rg.name
}


output "resource_group_location" {
    description = "Resource Group Location"
    value = azurerm_resource_group.sample-rg.location
}