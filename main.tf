resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "privatesub1" {
  cidr_block = "10.0.0.0/24"
  vpc_id = aws_vpc.main.id
  availability_zone = "ap-south-1a"
   tags = {
    Name = "privatesub1"
  }
}

resource "aws_subnet" "privatesub2" {
  cidr_block = "10.0.0.0/24"
  vpc_id = aws_vpc.main.id
  availability_zone = "ap-south-1b"

     tags = {
    Name = "privatesub2"
  }
}

resource "aws_subnet" "publicsub1" {
  cidr_block = "10.0.0.0/24"
  vpc_id = aws_vpc.main.id
  availability_zone = "ap-south-1a"

     tags = {
    Name = "publicsub1"
  }
}

resource "aws_subnet" "publicsub2" {
  cidr_block = "10.0.0.0/24"
  vpc_id = aws_vpc.main.id
  availability_zone = "ap-south-1b"

     tags = {
    Name = "publicsub2"
  }
}

resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_nat_gateway" "NATforprivate1" {
  allocation_id = aws_eip.example.id
  subnet_id     = aws_subnet.

  tags = {
    Name = "gw NAT"
  }

  depends_on = [aws_internet_gateway.myigw.id]
}

resource "aws_route_table" "RTforpublicsub" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "RTforpublicsub"
  }
}

resource "aws_route" "name" {
  route_table_id = aws_route_table.RTforpublicsub.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.myigw.id
}

resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "RTforpublicsub" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "RTforpublicsub"
  }
}

resource "aws_route" "name" {
  route_table_id = aws_route_table.RTforpublicsub.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.myigw.id
}resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "RTforpublicsub" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "RTforpublicsub"
  }
}

resource "aws_route" "name" {
  route_table_id = aws_route_table.RTforpublicsub.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.myigw.id
}