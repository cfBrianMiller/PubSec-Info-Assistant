resource "azurerm_private_endpoint" "kvPe" {
  count                         = var.is_secure_mode ? 1 : 0
  name                          = "${var.name}-kv-pe"
  location                      = var.location
  resource_group_name           = var.resourceGroupName
  subnet_id                     = var.privateEndpointSubnetId
  custom_network_interface_name = var.privateEndpointNicName != "" ? var.privateEndpointNicName : null
  private_service_connection {
    name                           = var.privateEndpointName != "" ? "${var.name}-kv-pe-connection" : var.privateEndpointName
    is_manual_connection           = false
    private_connection_resource_id = azurerm_key_vault.kv.id
    subresource_names              = ["vault"]
  }
}
