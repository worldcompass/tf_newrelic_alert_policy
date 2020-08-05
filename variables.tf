variable "policy_name" {
  description = "The name of the policy which the conditions and alert channels will be assosiated with"
  default     = null
}

variable "alert_channel_email" {
  description = "Email address for email nofitications"
  type        = list(string)
  default     = []
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