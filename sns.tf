# SNS
resource "aws_sns_topic" "grotrack_alerts" {
  name = "grotrack-alerts"
}

resource "aws_sns_topic_subscription" "email_alert" {
  topic_arn = aws_sns_topic.grotrack_alerts.arn
  protocol  = "email"
  endpoint  = "lucas.marcolino@sptech.school"
}