# create vpc block
# terraform aws create vpc
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${var.vpc_tag}"
  }
}

# create internet gateway and attach to custom vpc
resource "aws_internet_gateway" "test_igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.igw_tag}"
  }
}

# create route table and add public route
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test_igw.id
  }

  tags = {
    Name = "${var.rt_tag-1}"
  }
}

# associate public subnet az1 to "public route table"
resource "aws_route_table_association" "public_route_1" {
  subnet_id      = aws_subnet.public_1a.id
  route_table_id = aws_route_table.public_rt.id
}

# associate public subnet az2 to "public route table"

resource "aws_route_table_association" "public_route_2" {
  subnet_id      = aws_subnet.public_1b.id
  route_table_id = aws_route_table.public_rt.id
}

# create route table and add private route
resource "aws_route_table" "private_rt-1" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "${var.rt_tag-2}"
  }
}

# associate private subnet az1 to "private route table"
resource "aws_route_table_association" "private_route_1" {
  subnet_id      = aws_subnet.private_1a.id
  route_table_id = aws_route_table.private_rt-1.id
}

# associate private subnet az2 to "private route table"
resource "aws_route_table_association" "private_route_2" {
  subnet_id      = aws_subnet.private_1b.id
  route_table_id = aws_route_table.private_rt-1.id
}