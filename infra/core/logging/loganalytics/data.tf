data "azurerm_log_analytics_workspace" "existing_LogAnalytics" {
  count               = var.use_existing ? 1 : 0
  name                = var.existing_logAnalyticsName
  resource_group_name = var.resourceGroupName
}

data "azurerm_application_insights" "existing_ApplicationInsights" {
  count               = var.use_existing ? 1 : 0
  name                = var.existing_applicationInsightsName
  resource_group_name = var.resourceGroupName
}
