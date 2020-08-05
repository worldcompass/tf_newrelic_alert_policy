resource "newrelic_alert_policy" "policy" {
  name                = var.policy_name
  incident_preference = var.incident_preference
  channel_ids = flatten([
    newrelic_alert_channel.email_alert_channel[*].id,
    length(newrelic_alert_channel.webhook_alert_channel) > 0 ? newrelic_alert_channel.webhook_alert_channel[0].id : 0,
    length(newrelic_alert_channel.pagerduty_alert_channel) > 0 ? newrelic_alert_channel.pagerduty_alert_channel[0].id : 0,
    length(newrelic_alert_channel.victorops_alert_channel) > 0 ? newrelic_alert_channel.victorops_alert_channel[0].id : 0,
    length(newrelic_alert_channel.slack_alert_channel) > 0 ? newrelic_alert_channel.slack_alert_channel[0].id : 0,
  ])
}

resource "newrelic_alert_channel" "email_alert_channel" {
  count = length(var.alert_channel_email)
  name  = "email notification"
  type  = "email"

  config {
    include_json_attachment = var.include_json_attachment
    recipients              = element(var.alert_channel_email, count.index)
  }
}

resource "newrelic_alert_channel" "webhook_alert_channel" {
  count = var.alert_channel_webhook == "" ? 0 : 1

  name = "Webhook"
  type = "webhook"
  config {
    base_url     = var.alert_channel_webhook
    payload_type = "application/json"
  }
}

resource "newrelic_alert_channel" "pagerduty_alert_channel" {
  count = var.pagerduty_service_key == "" ? 0 : 1

  name = "pagerduty"
  type = "pagerduty"

  config {
    service_key = var.pagerduty_service_key
  }
}

resource "newrelic_alert_channel" "victorops_alert_channel" {
  count = var.vicrorops_key == "" ? 0 : 1

  name = "victorops"
  type = "victorops"

  config {
    key       = var.vicrorops_key
    route_key = var.vicrorops_route_key
  }

}

resource "newrelic_alert_channel" "slack_alert_channel" {
  count = var.slack_url == "" ? 0 : 1

  name = "slack"
  type = "slack"

  config {
    url     = "https://${var.slack_url}.slack.com"
    channel = var.slack_alert_channel
  }
}