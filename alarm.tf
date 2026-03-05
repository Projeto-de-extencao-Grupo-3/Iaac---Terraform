# trilha de alarm do cloudwatch
resource "aws_cloudwatch_metric_alarm" "cpu_alarm_frontend" {
  alarm_name          = "cpu-high-frontend"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "CPU usage too high"

  dimensions = {
    InstanceId = aws_instance.frontend_grotrack.id
  }

  alarm_actions = [
    aws_sns_topic.grotrack_alerts.arn
  ]
}