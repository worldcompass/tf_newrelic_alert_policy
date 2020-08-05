variable "policy_name" {
  description = "The name of the policy which the conditions and alert channels will be assosiated with"
  default     = null
}

variable "alert_channel_email" {
  description = "Email address for email nofitications"
  type        = list(string)
  default     = []
}

variable "include_json_attachment" {
  description = "attach json to email 1 for no, 0 for yes. NO by default"
  type        = number
  default     = 1
}

variable "alert_channel_webhook" {
  description = "Webhook notifications"
  type        = string
  default     = ""
}

variable "pagerduty_service_key" {
  type    = string
  default = ""
}

variable "incident_preference" {
  description = "The rollup strategy of the alert policy.  Valid values are PER_POLICY, PER_CONDITION, and PER_CONDITION_AND_TARGET"
  type        = string
  default     = "PER_CONDITION_AND_TARGET"
}

#victorops variables
variable "vicrorops_key" {
  description = "The key for integrating with VictorOps."
  type        = string
  default     = ""
}
variable "vicrorops_route_key" {
  description = "The route key for integrating with VictorOps."
  type        = string
  default     = ""
}

#slack variables
variable "slack_url" {
  description = "Your organization's Slack URL. Only the URL part"
  type        = string
  default     = ""
}
variable "slack_alert_channel" {
  description = "The Slack channel to send notifications to."
  type        = string
  default     = ""
}