#create network interface for web VM
resource "azurerm_network_interface" "webvm-nic" {
    name = "webvm-nic"
    location = var.location
	resource_group_name = var.resource_group

    ip_configuration{
        name = "webvm-nic-configuration"
        subnet_id = var.web_subnet_id
        private_ip_address_allocation = "Dynamic"
    }
}

#Availability set creation for web VM
resource "azurerm_availability_set" "webvm_availabilty_set" {
  name                = "webvm_availabilty_set"
  location            = var.location
  resource_group_name = var.resource_group
}

#WEB VM creation
resource "azurerm_virtual_machine" "sample-webvm" {
  name = "sample-webvm"
  location = var.location
  resource_group_name = var.resource_group
  network_interface_ids = [ azurerm_network_interface.webvm-nic.id ]
  availability_set_id = azurerm_availability_set.webvm_availabilty_set.id
  vm_size = "Standard_DS1_v2"
  delete_os_disk_on_termination = true
#  delete_data_disks_on_termination = true
  
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name = "webvmdisk"
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name = var.webvm_hostname
    admin_username = var.webvm_username
    admin_password = var.webvm_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
  
  tags = {
    environment = "demo"
  }
}
  
  
#create network interface for App VM
resource "azurerm_network_interface" "appvm-nic" {
  name = "appvm-nic"
  resource_group_name = var.resource_group
  location = var.location

  ip_configuration{
    name = "appvm-nic-configuration"
    subnet_id = var.app_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}


#Availability set creation for App VM
resource "azurerm_availability_set" "appvm_availabilty_set" {
  name                = "appvm_availabilty_set"
  location            = var.location
  resource_group_name = var.resource_group
}

#APP VM creation
resource "azurerm_virtual_machine" "sample-appvm" {
  name = "sample-appvm"
  location = var.location
  resource_group_name = var.resource_group
  network_interface_ids = [ azurerm_network_interface.appvm-nic.id ]
  availability_set_id = azurerm_availability_set.appvm_availabilty_set.id
  vm_size = "Standard_DS1_v2"
  delete_os_disk_on_termination = true
#  delete_data_disks_on_termination = true
  
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name = "appvmdisk"
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name = var.appvm_hostname
    admin_username = var.appvm_username
    admin_password = var.appvm_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
  
  tags = {
    environment = "demo"
  }
}