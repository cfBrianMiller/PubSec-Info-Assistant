variable "logAnalyticsName" {
  type = string
}

variable "applicationInsightsName" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "skuName" {
  type    = string
  default = "PerGB2018"
}

variable "resourceGroupName" {
  type = string
}

variable "logWorkbookName" {
  description = "The name of the log workbook"
  type        = string
  default     = ""
}

variable "componentResource" {
  description = "The component resource"
  type        = string
  default     = ""
}

variable "is_secure_mode" {
  type        = bool
  default     = false
  description = "value to enable secure mode, secure mode configures AMPLS endpoints"
}

variable "use_existing" {
  type        = bool
  default     = false
  description = "value to enable use existing resources"
}

variable "existing_logAnalyticsName" {
  type        = string
  default     = ""
  description = "The name of the existing log analytics workspace"
}

variable "existing_applicationInsightsName" {
  type        = string
  default     = ""
  description = "The name of the existing application insights"
}
