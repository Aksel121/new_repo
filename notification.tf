# Web-tier CloudWatch Alarm
resource "aws_cloudwatch_metric_alarm" "web_alarm" {
  alarm_name          = "web_instance_cpu_alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.ec2_asg.name
  }

  alarm_description = "Web instance CPU utilization alarm."
  actions_enabled   = true
  alarm_actions     = [aws_sns_topic.web_sns.arn]
}

# App-tier CloudWatch Alarm
resource "aws_cloudwatch_metric_alarm" "app_alarm" {
  alarm_name          = "app_instance_cpu_alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.app_asg.name
  }

  alarm_description = "App instance CPU utilization alarm."
  actions_enabled   = true
  alarm_actions     = [aws_sns_topic.app_sns.arn]
}

# SNS Topic for Web-tier Alarms
resource "aws_sns_topic" "web_sns" {
  name = "web-sns-topic"
}

# SNS Topic for App-tier Alarms
resource "aws_sns_topic" "app_sns" {
  name = "app-sns-topic"
}

# SNS Subscription for Web-tier Alarms
resource "aws_sns_topic_subscription" "web_sns_subscription" {
  topic_arn = aws_sns_topic.web_sns.arn
  protocol  = "email"
  endpoint  = "your-web-tier-email@example.com"  # Replace with actual email address
}

# SNS Subscription for App-tier Alarms
resource "aws_sns_topic_subscription" "app_sns_subscription" {
  topic_arn = aws_sns_topic.app_sns.arn
  protocol  = "email"
  endpoint  = "messiwhanna@gmail.com"  # Replace with actual email address
}
