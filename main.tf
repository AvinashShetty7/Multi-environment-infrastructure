module "vpcinfra" {
  source = "./modules/vpcinfra"
}

resource "aws_security_group" "security-group" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = module.vpcinfra.vpc_id

  tags = {
    Name = "security-group"
  }
}