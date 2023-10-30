resource "azurerm_network_security_group" "sample-nsg-web" {
  name                = "sample-nsg-web"
  location            = var.location
  resource_group_name = var.resource_group
  
  security_rule {
    name                       = "rule1"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  
  security_rule {
    name                       = "rule2"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "10.0.3.0/24"
    destination_address_prefix = "*"
}
}

resource "azurerm_subnet_network_security_group_association" "sample-nsg-web-subnet" {
  subnet_id = var.web_subnet_id
  network_security_group_id = azurerm_network_security_group.sample-nsg-web.id
}


resource "azurerm_network_security_group" "sample-nsg-app" {
  name = "sample-nsg-app"
  location = var.location
  resource_group_name = var.resource_group

  security_rule {
    name 						= "rule1"
    priority 					= 100
    direction 					= "Inbound"
    access 						= "Allow"
    protocol 					= "Tcp"
    source_port_range 			= "*"
    destination_port_range 		= "22"
	source_address_prefix 		= "10.0.1.0/24"
	destination_address_prefix 	= "*"
    }
    
  security_rule {
    name 						= "rule2"
    priority 					= 101
    direction 					= "Outbound"
    access 						= "Allow"
    protocol 					= "Tcp"
    source_port_range 			= "*"
    destination_port_range 		= "22"
	source_address_prefix 		= "10.0.1.0/24"
    destination_address_prefix 	= "*"
    }
	
  security_rule {
    name 						= "rule2"
    priority 					= 101
    direction 					= "Outbound"
    access 						= "Allow"
    protocol 					= "Tcp"
    source_port_range 			= "*"
    destination_port_range 		= "22"
	source_address_prefix 		= "10.0.3.0/24"
    destination_address_prefix 	= "*"
    }	

}

resource "azurerm_subnet_network_security_group_association" "sample-nsg-app-subnet" {
  subnet_id                 = var.app_subnet_id
  network_security_group_id = azurerm_network_security_group.sample-nsg-app.id
}


resource "azurerm_network_security_group" "sample-nsg-db" {
  name = "sample-nsg-db"
  location = var.location
  resource_group_name = var.resource_group

  security_rule {
    name 						= "rule1"
    priority 					= 101
    direction 					= "Inbound"
    access 						= "Allow"
    protocol 					= "Tcp"
    source_port_range 			= "*"
    destination_port_range 		= "3389"
    source_address_prefix 		= "10.0.2.0/24"
    destination_address_prefix 	= "*"
    }
    
  security_rule {
    name 						= "rule2"
    priority 					= 102
    direction 					= "Outbound"
    access 						= "Allow"
    protocol 					= "Tcp"
    source_port_range 			= "*"
    destination_port_range 		= "3389"
    source_address_prefix 		= "10.0.2.0/24"
    destination_address_prefix 	= "*"
    }
    
  security_rule {
    name 						= "rule3"
    priority 					= 100
    direction 					= "Outbound"
    access 						= "Deny"
    protocol 					= "Tcp"
    source_port_range 			= "*"
    destination_port_range 		= "3389"
	source_address_prefix 		= "10.0.1.0/24"
	destination_address_prefix 	= "*"
    }
}

resource "azurerm_subnet_network_security_group_association" "sample-nsg-db-subnet" {
  subnet_id = var.db_subnet_id
  network_security_group_id = azurerm_network_security_group.sample-nsg-db.id
}
