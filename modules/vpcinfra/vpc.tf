# # ++++++++++++++++++++++vpc CREATION ++++++++++++++++++++++++++++++
# resource "aws_vpc" "main" {
#   cidr_block = var.vpc_cidr
#   tags = {
#     Name="${var.environment}-main"
#   }
# }

# # +++++++++++++++++++++ SUBNET CREATION ++++++++++++++++++++++++
# resource "aws_subnet" "privatesub1" {
#   cidr_block = var.privatesub1_cidr
#   vpc_id = aws_vpc.main.id
#   availability_zone = "ap-south-1a"
#    tags = {
#     Name = "${var.environment}-privatesub1"
#   }
# }

# resource "aws_subnet" "privatesub2" {
#   cidr_block = var.privatesub2_cidr
#   vpc_id = aws_vpc.main.id
#   availability_zone = "ap-south-1b"

#      tags = {
#     Name = "${var.environment}-privatesub2"
#   }
# }

# resource "aws_subnet" "publicsub1" {
#   cidr_block = var.publicsub1_cidr
#   vpc_id = aws_vpc.main.id
#   availability_zone = "ap-south-1a"

#      tags = {
#     Name = "${var.environment}-publicsub1"
#   }
# }

# resource "aws_subnet" "publicsub2" {
#   cidr_block = var.publicsub2_cidr
#   vpc_id = aws_vpc.main.id
#   availability_zone = "ap-south-1b"

#      tags = {
#     Name = "${var.environment}-publicsub2"
#   }
# }


# # +++++++++++++++++++++ INTERNET GATEWAY CREATION ++++++++++++++++++++++++
# resource "aws_internet_gateway" "myigw" {
#   vpc_id = aws_vpc.main.id

#   tags = {
#     Name="${var.environment}-igw"
#   }
# }


# # +++++++++++++++++++++ ELASTSIC IP CREATION ++++++++++++++++++++++++

# resource "aws_eip" "ip1" {
  
# }

# resource "aws_eip" "ip2" {
  
# }

# # +++++++++++++++++++++ NAT GATEWAY CREATION ++++++++++++++++++++++++

# resource "aws_nat_gateway" "NATforprivate1" {
#   allocation_id = aws_eip.ip1.id
#   subnet_id     = aws_subnet.publicsub1.id

#   tags = {
#     Name = "${var.environment}-NATforprivate1"
#   }

#   depends_on = [aws_internet_gateway.myigw]
# }

# resource "aws_nat_gateway" "NATforprivate2" {
#   allocation_id = aws_eip.ip2.id
#   subnet_id     = aws_subnet.publicsub2.id

#   tags = {
#     Name = "${var.environment}-NATforprivate2"
#   }

#   depends_on = [aws_internet_gateway.myigw]
# }


# # +++++++++++++++++++++ ROUTETABLE AND ROUTE CREATION ++++++++++++++++++++++++

# resource "aws_route_table" "RTforpublicsub" {
#   vpc_id = aws_vpc.main.id

#   tags = {
#     Name = "${var.environment}-RTforpublicsub"
#   }
# }

# resource "aws_route" "routeforpublicsub" {
#   route_table_id = aws_route_table.RTforpublicsub.id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id = aws_internet_gateway.myigw.id
# }



# resource "aws_route_table" "RTforprivatesub1" {
#   vpc_id = aws_vpc.main.id

#   tags = {
#     Name = "${var.environment}-RTforprivatesub1"
#   }
# }

# resource "aws_route" "routeforprivate1" {
#   route_table_id = aws_route_table.RTforprivatesub1.id
#   destination_cidr_block = "0.0.0.0/0"
#   nat_gateway_id = aws_nat_gateway.NATforprivate1.id
# }


# resource "aws_route_table" "RTforprivatesub2" {
#   vpc_id = aws_vpc.main.id

#   tags = {
#     Name = "${var.environment}-RTforprivatesub2"
#   }
# }

# resource "aws_route" "routeforprivate2" {
#   route_table_id = aws_route_table.RTforprivatesub2.id
#   destination_cidr_block = "0.0.0.0/0"
#   nat_gateway_id = aws_nat_gateway.NATforprivate2.id
# }


# # +++++++++++++++++++++ ROUTE TABLE ASSOCIATION CREATION ++++++++++++++++++++++++

# resource "aws_route_table_association" "rtassforpublicsub1" {
#   subnet_id      = aws_subnet.publicsub1.id
#   route_table_id = aws_route_table.RTforpublicsub.id
# }

# resource "aws_route_table_association" "rtassforpublicsub2" {
#   subnet_id      = aws_subnet.publicsub2.id
#   route_table_id = aws_route_table.RTforpublicsub.id
# }

# resource "aws_route_table_association" "rtassforprivatesub1" {
#   subnet_id      = aws_subnet.privatesub1.id
#   route_table_id = aws_route_table.RTforprivatesub1.id
# }

# resource "aws_route_table_association" "rtassforprivatesub2" {
#   subnet_id      = aws_subnet.privatesub2.id
#   route_table_id = aws_route_table.RTforprivatesub2.id
# }

















# ++++++++++++++++++++++vpc CREATION ++++++++++++++++++++++++++++++
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name="${var.environment}-main"
  }
}

# +++++++++++++++++++++ SUBNET CREATION ++++++++++++++++++++++++
resource "aws_subnet" "privatesub1" {
  cidr_block = var.privatesub1_cidr
  vpc_id = aws_vpc.main.id
  availability_zone = "ap-south-1a"
   tags = {
    Name = "${var.environment}-privatesub1"
  }
}

resource "aws_subnet" "privatesub2" {
  cidr_block = var.privatesub2_cidr
  vpc_id = aws_vpc.main.id
  availability_zone = "ap-south-1b"

     tags = {
    Name = "${var.environment}-privatesub2"
  }
}

resource "aws_subnet" "publicsub1" {
  cidr_block = var.publicsub1_cidr
  vpc_id = aws_vpc.main.id
  availability_zone = "ap-south-1a"

     tags = {
    Name = "${var.environment}-publicsub1"
  }
}

resource "aws_subnet" "publicsub2" {
  cidr_block = var.publicsub2_cidr
  vpc_id = aws_vpc.main.id
  availability_zone = "ap-south-1b"

     tags = {
    Name = "${var.environment}-publicsub2"
  }
}


# +++++++++++++++++++++ INTERNET GATEWAY CREATION ++++++++++++++++++++++++
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name="${var.environment}-igw"
  }
}


# +++++++++++++++++++++ ELASTSIC IP CREATION ++++++++++++++++++++++++

# resource "aws_eip" "ip1" {
  
# }

# resource "aws_eip" "ip2" {
  
# }

# +++++++++++++++++++++ NAT GATEWAY CREATION ++++++++++++++++++++++++

resource "aws_nat_gateway" "NATforprivate1" {
  # allocation_id = aws_eip.ip1.id
  connectivity_type = "private"
  subnet_id     = aws_subnet.privatesub1.id

  tags = {
    Name = "${var.environment}-NATforprivate1"
  }

  depends_on = [aws_internet_gateway.myigw]
}

resource "aws_nat_gateway" "NATforprivate2" {
  # allocation_id = aws_eip.ip2.id
  subnet_id     = aws_subnet.privatesub2.id
  connectivity_type = "private" 

  tags = {
    Name = "${var.environment}-NATforprivate2"
  }

  depends_on = [aws_internet_gateway.myigw]
}


# +++++++++++++++++++++ ROUTETABLE AND ROUTE CREATION ++++++++++++++++++++++++

resource "aws_route_table" "RTforpublicsub" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.environment}-RTforpublicsub"
  }
}

resource "aws_route" "routeforpublicsub" {
  route_table_id = aws_route_table.RTforpublicsub.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.myigw.id
}



resource "aws_route_table" "RTforprivatesub1" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.environment}-RTforprivatesub1"
  }
}

resource "aws_route" "routeforprivate1" {
  route_table_id = aws_route_table.RTforprivatesub1.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.NATforprivate1.id
}


resource "aws_route_table" "RTforprivatesub2" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.environment}-RTforprivatesub2"
  }
}

resource "aws_route" "routeforprivate2" {
  route_table_id = aws_route_table.RTforprivatesub2.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.NATforprivate2.id
}


# +++++++++++++++++++++ ROUTE TABLE ASSOCIATION CREATION ++++++++++++++++++++++++

resource "aws_route_table_association" "rtassforpublicsub1" {
  subnet_id      = aws_subnet.publicsub1.id
  route_table_id = aws_route_table.RTforpublicsub.id
}

resource "aws_route_table_association" "rtassforpublicsub2" {
  subnet_id      = aws_subnet.publicsub2.id
  route_table_id = aws_route_table.RTforpublicsub.id
}

resource "aws_route_table_association" "rtassforprivatesub1" {
  subnet_id      = aws_subnet.privatesub1.id
  route_table_id = aws_route_table.RTforprivatesub1.id
}

resource "aws_route_table_association" "rtassforprivatesub2" {
  subnet_id      = aws_subnet.privatesub2.id
  route_table_id = aws_route_table.RTforprivatesub2.id
}


