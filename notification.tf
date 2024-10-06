# # Web-tier CloudWatch Alarm
# resource "aws_cloudwatch_metric_alarm" "web_alarm" {
#   alarm_name          = "web_instance_cpu_alarm"
#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   evaluation_periods  = 2
#   metric_name         = "CPUUtilization"
#   namespace           = "AWS/EC2"
#   period              = 300
#   statistic           = "Average"
#   threshold           = 80
 
#   dimensions = {
#     InstanceId = aws_launch_template.template-web.id
#   }
 
#   alarm_description = "Web instance CPU utilization alarm."
#   actions_enabled   = true
#   alarm_actions     = [aws_sns_topic.web_sns.arn]
# }

# # App-tier CloudWatch Alarm
# resource "aws_cloudwatch_metric_alarm" "app_alarm" {
#   alarm_name          = "app_instance_cpu_alarm"
#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   evaluation_periods  = 2
#   metric_name         = "CPUUtilization"
#   namespace           = "AWS/EC2"
#   period              = 300
#   statistic           = "Average"
#   threshold           = 80
 
#   dimensions = {
#     InstanceId = aws_launch_template.template-app.id
#   }
 
#   alarm_description = "App instance CPU utilization alarm."
#   actions_enabled   = true
#   alarm_actions     = [aws_sns_topic.app_sns.arn]
# }
