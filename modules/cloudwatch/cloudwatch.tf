resource "aws_autoscaling_policy" "mypolicy" {
  name                   = "mypolicy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = var.autoscale_grpname
}

resource "aws_autoscaling_policy" "mypolicy2" {
  name                   = "mypolicy2"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = var.autoscale_grpname
}

resource "aws_cloudwatch_metric_alarm" "mycloudwatch" {
  alarm_name          = "autoscalealaram"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Maximum"
  threshold           = 50

  dimensions = {
    AutoScalingGroupName = var.autoscale_grpname
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = [aws_autoscaling_policy.mypolicy.arn,aws_sns_topic.mytopic.arn]
}

resource "aws_cloudwatch_metric_alarm" "mycloudwatch-scalein" {
  alarm_name          = "scalein_alaram"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 20

  dimensions = {
    AutoScalingGroupName = var.autoscale_grpname
  }


  alarm_description = "This metric alram for scale in"
  alarm_actions     = [aws_autoscaling_policy.mypolicy2.arn]
}


resource "aws_sns_topic" "mytopic" {
  name = "user-updates-topic"
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.mytopic.arn
  protocol  = "email"
  endpoint  = "shettyavinasha2004@gmail.com"
}


