output "vpc_id" {
  value = aws_vpc.main.id
}

output "publicsub1_id" {
  value = aws_subnet.publicsub1.id
}

output "publicsub2_id" {
  value = aws_subnet.publicsub2.id
}

output "privatesub1_id" {
  value = aws_subnet.privatesub1.id
}

output "privatesub2_id" {
  value = aws_subnet.privatesub2.id
}

