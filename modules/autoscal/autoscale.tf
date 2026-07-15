resource "aws_launch_template" "launch_tamplate" {
  name = "l_tamplate"
  image_id = var.image_id_launchtamplate
  instance_type = var.instance_type_launchtamplate
  key_name = var.keyname_launchtamplate
  monitoring {
    enabled = true
  }
  vpc_security_group_ids = [aws_security_group.security-group.id]

    tags = {
      Name = "${var.environment}-launch_tamplate"
    }
  user_data = filebase64decode("${path.module}/exec.sh")
}

resource "aws_autoscaling_group" "ASG" {
  name = "myASG"
  desired_capacity   = 2
  max_size           = 4
  min_size           = 2

  launch_template {
    id      = aws_launch_template.launch_tamplate.id
    version = "$Latest"
  }
tag {
  key = "Name"
  value = "firstASG"
  propagate_at_launch = true
}
}