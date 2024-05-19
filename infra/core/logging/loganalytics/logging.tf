resource "azurerm_log_analytics_workspace" "logAnalytics" {
  count               = var.use_existing ? 0 : 1
  name                = var.logAnalyticsName
  location            = var.location
  resource_group_name = var.resourceGroupName
  sku                 = var.skuName
  tags                = var.tags
  retention_in_days   = 30
}

resource "azurerm_application_insights" "applicationInsights" {
  count               = var.use_existing ? 0 : 1
  name                = var.applicationInsightsName
  location            = var.location
  resource_group_name = var.resourceGroupName
  application_type    = "web"
  tags                = var.tags
  workspace_id        = azurerm_log_analytics_workspace.logAnalytics[0].id
}

resource "azurerm_monitor_private_link_scope" "privateLinkScope" {
  count               = var.use_existing ? 0 : var.is_secure_mode ? 1 : 0
  name                = "${var.logAnalyticsName}-private-link-scope"
  resource_group_name = var.resourceGroupName
}

resource "azurerm_monitor_private_link_scoped_service" "privateLinkScopeServiceAppInsights" {
  count               = var.use_existing ? 0 : var.is_secure_mode ? 1 : 0
  name                = "${var.logAnalyticsName}-private-link-app-insights"
  resource_group_name = var.resourceGroupName
  scope_name          = azurerm_monitor_private_link_scope.privateLinkScope[0].id
  linked_resource_id  = azurerm_application_insights.applicationInsights[0].id
}

resource "azurerm_monitor_private_link_scoped_service" "privateLinkScopeServiceLogAnalytics" {
  count               = var.use_existing ? 0 : var.is_secure_mode ? 1 : 0
  name                = "${var.logAnalyticsName}-private-link-log-analytics"
  resource_group_name = var.resourceGroupName
  scope_name          = azurerm_monitor_private_link_scope.privateLinkScope[0].id
  linked_resource_id  = azurerm_log_analytics_workspace.logAnalytics[0].id
}
