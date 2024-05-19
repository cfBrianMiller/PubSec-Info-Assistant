resource "azurerm_private_endpoint" "storageBlobPrivateEndpoint" {
  count                         = var.is_secure_mode ? 1 : 0
  name                          = var.blobPrivateEndpointName
  location                      = var.location
  resource_group_name           = var.resourceGroupName
  subnet_id                     = var.privateEndpointSubnetId
  custom_network_interface_name = var.blobPrivateEndpointName
  private_service_connection {
    name                           = "blob"
    private_connection_resource_id = azurerm_storage_account.storage.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }
}

resource "azurerm_private_endpoint" "storageQueuePrivateEndpoint" {
  count                         = var.is_secure_mode ? 1 : 0
  name                          = var.queuePrivateEndpointName
  location                      = var.location
  resource_group_name           = var.resourceGroupName
  subnet_id                     = var.privateEndpointSubnetId
  custom_network_interface_name = var.queuePrivateEndpointName
  private_service_connection {
    name                           = "queue"
    private_connection_resource_id = azurerm_storage_account.storage.id
    is_manual_connection           = false
    subresource_names              = ["queue"]
  }
}
