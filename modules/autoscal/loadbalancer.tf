resource "aws_lb" "load_balancer" {
  name               = "my-LB"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.security-group.id]
  subnets            = var.subnetsid_loadbalancer

  enable_deletion_protection = false

  tags = {
    Environment = "${var.environment}-loadbalcer"
  }
}

resource "aws_lb_target_group" "target_agroup" {
  name     = "my-target"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  
}


resource "aws_lb_listener" "alb_listner" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_agroup.arn
  }
}

