output "lbdns" {
  value = aws_lb.load_balancer.dns_name
}

output "bastian_publicip" {
  value = aws_instance.bastian.public_ip
}