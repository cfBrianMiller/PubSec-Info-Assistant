output "applicationInsightsId" {
  value = var.use_existing ? data.azurerm_application_insights.existing_ApplicationInsights[0].id : azurerm_application_insights.applicationInsights[0].id
}

output "logAnalyticsId" {
  value = var.use_existing ? data.azurerm_log_analytics_workspace.existing_LogAnalytics[0].id : azurerm_log_analytics_workspace.logAnalytics[0].id
}

output "applicationInsightsName" {
  value = var.use_existing ? data.azurerm_application_insights.existing_ApplicationInsights[0].name : azurerm_application_insights.applicationInsights[0].name
}

output "logAnalyticsName" {
  value = var.use_existing ? data.azurerm_log_analytics_workspace.existing_LogAnalytics[0].name : azurerm_log_analytics_workspace.logAnalytics[0].name
}

output "applicationInsightsInstrumentationKey" {
  value = var.use_existing ? data.azurerm_application_insights.existing_ApplicationInsights[0].instrumentation_key : azurerm_application_insights.applicationInsights[0].instrumentation_key
}

output "applicationInsightsConnectionString" {
  value = var.use_existing ? data.azurerm_application_insights.existing_ApplicationInsights[0].connection_string : azurerm_application_insights.applicationInsights[0].connection_string
}
