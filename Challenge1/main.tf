provider "azurerm" {
  features {}
}

module "rg" {
  source         = "./modules/rg"
  name           = var.name
  location       = var.location
}

module "network" {
  source         = "./modules/network"
  location       = module.rg.resource_group_location
  resource_group = module.rg.resource_group_name
}

module "sg" {
  source         = "./modules/sg"
  location       = module.rg.resource_group_location
  resource_group = module.rg.resource_group_name 
  web_subnet_id  = module.network.websubnet_id
  app_subnet_id  = module.network.appsubnet_id
  db_subnet_id   = module.network.dbsubnet_id
}

module "vm" {
  source         = "./modules/vm"
  location = module.rg.resource_group_location
  resource_group = module.rg.resource_group_name
  web_subnet_id = module.network.websubnet_id
  app_subnet_id = module.network.appsubnet_id
  webvm_hostname = var.webvm_hostname
  webvm_username = var.webvm_username
  webvm_password = var.webvm_password
  appvm_hostname = var.appvm_hostname
  appvm_username = var.appvm_username
  appvm_password = var.appvm_password
}

module "db" {
  source = "./modules/db"
  location = module.rg.resource_group_location
  resource_group = module.rg.resource_group_name
  sql_server_db = var.sql_server_db
  sql_server_version = var.sql_server_version
  database_admin = var.database_admin
  database_password = var.database_password
}