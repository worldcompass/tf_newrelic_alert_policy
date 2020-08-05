output "policy" {
  description = "Info about created policy and assosiated alert channels"
  value       = newrelic_alert_policy.policy
}