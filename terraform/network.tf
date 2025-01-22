resource "azurerm_virtual_network" "primary" {
  name                = "primary-vnet"
  resource_group_name = azurerm_resource_group.primary.name
  location            = azurerm_resource_group.primary.location
  address_space       = ["192.168.1.0/24"]
}

resource "azurerm_virtual_network" "secondary" {
  name                = "secondary-vnet"
  resource_group_name = azurerm_resource_group.secondary.name
  location            = azurerm_resource_group.secondary.location
  address_space       = ["192.168.2.0/24"]
}

resource "azurerm_subnet" "primary" {
  name                 = "primary-subnet"
  resource_group_name  = azurerm_resource_group.primary.name
  virtual_network_name = azurerm_virtual_network.primary.name
  address_prefixes     = ["192.168.1.0/24"]
}

resource "azurerm_subnet" "secondary" {
  name                 = "secondary-subnet"
  resource_group_name  = azurerm_resource_group.secondary.name
  virtual_network_name = azurerm_virtual_network.secondary.name
  address_prefixes     = ["192.168.2.0/24"]

}

resource "azurerm_public_ip" "primary" {
  name                = "primary-pip"
  location            = azurerm_resource_group.primary.location
  resource_group_name = azurerm_resource_group.primary.name
  allocation_method   = "Dynamic"
}

resource "azurerm_public_ip" "secondary" {
  name                = "secondary-pip"
  location            = azurerm_resource_group.secondary.location
  resource_group_name = azurerm_resource_group.secondary.name
  allocation_method   = "Dynamic"
}


resource "azurerm_network_interface" "nic" {
  name                = "primary-nic"
  location            = azurerm_resource_group.primary.location
  resource_group_name = azurerm_resource_group.primary.name

  ip_configuration {
    name                          = "primary-nic-ipconfig"
    subnet_id                     = azurerm_subnet.primary.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.primary.id
  }
}