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
  user_data = filebase64(("${path.module}/exec.sh"))
  # depends_on = var.
}


resource "aws_autoscaling_group" "ASG" {
  name = "myASG"
  desired_capacity   = 2
  max_size           = 4
  min_size           = 2
  # availability_zones = [ "ap-south-1a","ap-south-1b" ]
  vpc_zone_identifier = var.vpc_zone_identifier_to_autoscale
  launch_template {
    id      = aws_launch_template.launch_tamplate.id
    version = "$Latest"
  }

  target_group_arns = [ aws_lb_target_group.target_agroup.arn ]
tag {
  key = "Name"
  value = "firstASG"
  propagate_at_launch = true
}
}


resource "aws_instance" "bastian" {
  ami           = "ami-01a00762f46d584a1"
  instance_type = "t2.micro"
  subnet_id = var.subnetid_for_bastian
  associate_public_ip_address = true
  key_name = "iam_avinash"
  security_groups = [aws_security_group.security-group.id]
  tags = {
    Name = "${var.environment}-bastian"
  }
}